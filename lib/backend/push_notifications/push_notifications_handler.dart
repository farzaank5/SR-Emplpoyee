import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Screenshot_2023-11-26_at_10.41.00_PM.png',
            fit: BoxFit.fitHeight,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Loginpage': ParameterData.none(),
  'villasBookingDetails': (data) async => ParameterData(
        allParams: {
          'placeRef': getParameter<DocumentReference>(data, 'placeRef'),
          'startDate': getParameter<DateTime>(data, 'startDate'),
          'endDate': getParameter<DateTime>(data, 'endDate'),
          'totalGuests': getParameter<DocumentReference>(data, 'totalGuests'),
          'bookingRef': getParameter<DocumentReference>(data, 'bookingRef'),
        },
      ),
  'bookingconfirmed': (data) async => ParameterData(
        allParams: {
          'placeRef': getParameter<DocumentReference>(data, 'placeRef'),
          'startDate': getParameter<DateTime>(data, 'startDate'),
          'endDate': getParameter<DateTime>(data, 'endDate'),
        },
      ),
  'Employee_home': ParameterData.none(),
  'bookmarked': ParameterData.none(),
  'bookingHistory': ParameterData.none(),
  'villasDetails': (data) async => ParameterData(
        allParams: {
          'placeRef': getParameter<DocumentReference>(data, 'placeRef'),
          'bookingRef': getParameter<DocumentReference>(data, 'bookingRef'),
        },
      ),
  'Earnings': ParameterData.none(),
  'villasDetailsfromlist': (data) async => ParameterData(
        allParams: {
          'placeRef': getParameter<DocumentReference>(data, 'placeRef'),
        },
      ),
  'currentBookings': ParameterData.none(),
  'employee_Profile': (data) async => ParameterData(
        allParams: {
          'hii': getParameter<String>(data, 'hii'),
        },
      ),
  'bookingCalender': (data) async => ParameterData(
        allParams: {
          'villaref': getParameter<DocumentReference>(data, 'villaref'),
        },
      ),
  'bookingCalenderCopy': (data) async => ParameterData(
        allParams: {
          'villaref': getParameter<DocumentReference>(data, 'villaref'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
