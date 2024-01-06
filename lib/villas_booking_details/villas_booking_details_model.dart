import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'villas_booking_details_widget.dart' show VillasBookingDetailsWidget;
import 'package:flutter/material.dart';

class VillasBookingDetailsModel
    extends FlutterFlowModel<VillasBookingDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  String? _nameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for ChoiceChips widget.
  String? choiceChipsValue;
  FormFieldController<List<String>>? choiceChipsValueController;
  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageController;
  String? Function(BuildContext, String?)? ageControllerValidator;
  // State field(s) for contact widget.
  FocusNode? contactFocusNode;
  TextEditingController? contactController;
  String? Function(BuildContext, String?)? contactControllerValidator;
  String? _contactControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Requires at least 10 characters.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for Verification widget.
  FocusNode? verificationFocusNode;
  TextEditingController? verificationController;
  String? Function(BuildContext, String?)? verificationControllerValidator;
  String? _verificationControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 20) {
      return 'Requires at least 20 characters.';
    }
    if (val.length > 20) {
      return 'Maximum 20 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for CountControlleradult widget.
  int? countControlleradultValue;
  // State field(s) for CountControllerchildren widget.
  int? countControllerchildrenValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    nameControllerValidator = _nameControllerValidator;
    contactControllerValidator = _contactControllerValidator;
    verificationControllerValidator = _verificationControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nameFocusNode?.dispose();
    nameController?.dispose();

    ageFocusNode?.dispose();
    ageController?.dispose();

    contactFocusNode?.dispose();
    contactController?.dispose();

    verificationFocusNode?.dispose();
    verificationController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
