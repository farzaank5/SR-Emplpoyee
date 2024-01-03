import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> getUniqueVillas(List<String> list) {
  return list.toSet().toList();
}

List<VillasRecord> getPlaces(
  List<VillasRecord> list,
  List<VillasRecord> searchResults,
  bool searchBool,
  bool booking,
) {
  return searchBool ? searchResults : list;
}

int? calculateBasePrice(
  int pricePerNight,
  DateTime startDate,
  DateTime endDate,
) {
  return endDate.difference(startDate).inDays * pricePerNight;
}

List<String> getBookingList(
  List<BookingsRecord> bookingList,
  DateTime startDate,
  DateTime endDate,
) {
  List<String> bookings = [];

  for (var booking in bookingList) {
    if ((startDate.isBefore(booking.endDate!) ||
                startDate.isAtSameMomentAs(booking.endDate!)) &&
            (endDate.isAfter(booking.startDate!)) ||
        endDate.isAtSameMomentAs(booking.startDate!)) {
      bookings.add(booking.placeStringRef);
    }
  }

  return bookings;
}

double getEmployeeEarning(
  double calculatedBasePrice,
  double employeePer,
) {
  return employeePer * calculatedBasePrice / 100;
}

double? getProfit(
  double totalPrice,
  double employeeEarning,
) {
  return totalPrice - employeeEarning;
}

double? getMonthlyEarings(
  List<DateTime> bookTime,
  List<double> earnings,
) {
  //  write function to show current month earnings of an hotel bookings on the basis of its book time
// First, we need to filter the bookings to only include those from the current month
  final now = DateTime.now();
  final currentMonthBookings = <double>[];
  for (int i = 0; i < bookTime.length; i++) {
    if (bookTime[i].month == now.month && bookTime[i].year == now.year) {
      currentMonthBookings.add(earnings[i]);
    }
  }

  // Then, we can sum up the earnings for the current month
  double monthlyEarnings = 0;
  for (final earning in currentMonthBookings) {
    monthlyEarnings += earning;
  }

  return monthlyEarnings;
}

DateTime? getdatesblocked(
  String vIllasID,
  DateTime? startDate,
  DateTime? endDate,
) {
  // function to block all the booked dates in a calender with hotel name startDate and endDate.
// First, we need to check if the provided start and end dates are valid
  if (startDate == null || endDate == null || startDate.isAfter(endDate)) {
    return null;
  }

  // Next, we need to retrieve the document for the specified villa from Firestore
  final villaDoc =
      FirebaseFirestore.instance.collection('villas').doc(vIllasID);
  villaDoc.get().then((villaSnapshot) {
    if (villaSnapshot.exists) {
      // If the villa document exists, we need to retrieve its bookings subcollection
      final bookingsCollection = villaDoc.collection('bookings');

      // We can then query for any bookings that overlap with the provided date range
      final overlappingBookings = bookingsCollection
          .where('endDate', isGreaterThan: startDate)
          .where('startDate', isLessThan: endDate)
          .get();

      // Once we have the overlapping bookings, we can iterate over them and block the corresponding dates in the calendar
      overlappingBookings.then((querySnapshot) {
        for (final bookingDoc in querySnapshot.docs) {
          final bookingData = bookingDoc.data();
          final blockedStartDate = bookingData['startDate'].toDate();
          final blockedEndDate = bookingData['endDate'].toDate();

          // TODO: Block the corresponding dates in the calendar
        }
      });
    }
  });

  // We can return null for now, since we haven't implemented the calendar blocking logic yet
  return null;
}

List<DateTime> getBookedDates(
  DateTime checkInDates,
  DateTime checkOutDate,
) {
  // a function that show all the dates from checkin to checkout
  List<DateTime> bookedDates = [];
  for (var i = checkInDates;
      i.isBefore(checkOutDate);
      i = i.add(Duration(days: 1))) {
    bookedDates.add(i);
  }
  return bookedDates;
}
