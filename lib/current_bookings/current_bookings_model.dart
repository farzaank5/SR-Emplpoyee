import '/flutter_flow/flutter_flow_util.dart';
import 'current_bookings_widget.dart' show CurrentBookingsWidget;
import 'package:flutter/material.dart';

class CurrentBookingsModel extends FlutterFlowModel<CurrentBookingsWidget> {
  ///  Local state fields for this page.

  bool searchBool = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
