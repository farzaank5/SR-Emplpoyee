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
import '/backend/schema/structs/index.dart';
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

List<dynamic>? monthNameToCalander(
  int? month,
  List<DateTime>? disabledDay,
  List<DateTime>? selecteddate,
) {
  //
  final now = DateTime.now();
  final currentMonth = now.month;
  final currentYear = now.year;
  final daysInMonth = DateTime(currentYear, month! + 1, 0).day;
  final firstDayOfMonth = DateTime(currentYear, month, 1).weekday;
  final List<dynamic> calendar = [];

  for (var i = 1; i <= daysInMonth; i++) {
    final day = DateTime(currentYear, month, i);
    final isPastDay = day.isBefore(DateTime(now.year, now.month, now.day));
    final currentDate = DateTime(currentYear, month, i);
    final days = {
      'day': i,
      'date': currentDate,
      'disabled': disabledDay?.any((disabledDate) =>
              disabledDate.year == currentDate.year &&
              disabledDate.month == currentDate.month &&
              disabledDate.day == currentDate.day) ??
          false,
      'selecteddate': selecteddate?.any((selecteddate) =>
              selecteddate.year == currentDate.year &&
              selecteddate.month == currentDate.month &&
              selecteddate.day == currentDate.day) ??
          false,
      'today': currentMonth == month && i == now.day,
      'pastdays': isPastDay
    };
    calendar.add(days);
  }

  final List<dynamic> monthCalendar = [];

  for (var i = 0; i < firstDayOfMonth - 1; i++) {
    monthCalendar.add({'day': null});
  }

  monthCalendar.addAll(calendar);

  final remainingDays = 42 - monthCalendar.length;

  for (var i = 0; i < remainingDays; i++) {
    monthCalendar.add({'day': null});
  }

  return monthCalendar;
}

List<DateTime>? inBetweenday(
  List<DateTime>? startDate,
  List<DateTime>? endDate,
) {
  // return the days and inbetween list  days
  if (startDate == null || endDate == null) {
    return null;
  }

  List<DateTime> days = [];

  for (int i = 0; i < startDate.length; i++) {
    DateTime start = startDate[i];
    DateTime end = endDate[i];

    if (start.isAfter(end)) {
      continue;
    }

    while (start.isBefore(end) || start.isAtSameMomentAs(end)) {
      days.add(start);
      start = start.add(Duration(days: 1));
    }
  }

  return days;
}

int? monthtointeger(DateTime? date) {
  // datetime to month mm as integer eg. 20/4/2023 return as 4
  if (date == null) {
    return null;
  }
  return date.month;
}

DateTime? stringtoDate(String? date) {
  // string date to datetime
  if (date == null) {
    return null;
  }
  try {
    return DateTime.parse(date);
  } catch (e) {
    return null;
  }
}

List<DateTime>? inbetweendaysss(
  DateTime? start,
  DateTime? end,
) {
  /// in betwwen days from 1 start and 1 end dates

  // in between days from start to end
  if (start == null || end == null) {
    return null;
  }

  final List<DateTime> days = [];
  DateTime current = start;
  while (current.isBefore(end)) {
    days.add(current);
    current = current.add(const Duration(days: 1));
  }
  days.add(end);

  return days;
}

dynamic yearmonth(
  int? month,
  DateTime? date,
) {
  // incriment or decriment month from date and return YYYY and MMMM eg : month 1 = january
  if (month == null || date == null) {
    return null;
  }
  final newDate = DateTime(date.year, month, date.day);
  final monthh = DateFormat('MMMM');
  final year = DateFormat('yyyy');
  return {'month': monthh.format(newDate), 'year': year.format(newDate)};
}

List<String> getemplist(
  String firstname,
  String lastname,
) {
  // a function that shows the list of documents which contains the same user name
  return []; // TODO: Implement function logic
}
