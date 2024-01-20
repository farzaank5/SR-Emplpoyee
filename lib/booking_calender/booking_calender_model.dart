import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'booking_calender_widget.dart' show BookingCalenderWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingCalenderModel extends FlutterFlowModel<BookingCalenderWidget> {
  ///  Local state fields for this page.

  int? month = 1;

  List<int> disabledDay = [6, 18];
  void addToDisabledDay(int item) => disabledDay.add(item);
  void removeFromDisabledDay(int item) => disabledDay.remove(item);
  void removeAtIndexFromDisabledDay(int index) => disabledDay.removeAt(index);
  void insertAtIndexInDisabledDay(int index, int item) =>
      disabledDay.insert(index, item);
  void updateDisabledDayAtIndex(int index, Function(int) updateFn) =>
      disabledDay[index] = updateFn(disabledDay[index]);

  List<DateTime> selecteddate = [];
  void addToSelecteddate(DateTime item) => selecteddate.add(item);
  void removeFromSelecteddate(DateTime item) => selecteddate.remove(item);
  void removeAtIndexFromSelecteddate(int index) => selecteddate.removeAt(index);
  void insertAtIndexInSelecteddate(int index, DateTime item) =>
      selecteddate.insert(index, item);
  void updateSelecteddateAtIndex(int index, Function(DateTime) updateFn) =>
      selecteddate[index] = updateFn(selecteddate[index]);

  DateTime? selectedStart;

  DateTime? selectedEnd;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
