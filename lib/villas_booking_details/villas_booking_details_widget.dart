import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'villas_booking_details_model.dart';
export 'villas_booking_details_model.dart';

class VillasBookingDetailsWidget extends StatefulWidget {
  const VillasBookingDetailsWidget({
    super.key,
    required this.placeRef,
    required this.startDate,
    required this.endDate,
    this.totalGuests,
    this.bookingRef,
  });

  final DocumentReference? placeRef;
  final DateTime? startDate;
  final DateTime? endDate;
  final DocumentReference? totalGuests;
  final DocumentReference? bookingRef;

  @override
  _VillasBookingDetailsWidgetState createState() =>
      _VillasBookingDetailsWidgetState();
}

class _VillasBookingDetailsWidgetState
    extends State<VillasBookingDetailsWidget> {
  late VillasBookingDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VillasBookingDetailsModel());

    _model.nameController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.ageController ??= TextEditingController();
    _model.ageFocusNode ??= FocusNode();

    _model.contactController ??= TextEditingController();
    _model.contactFocusNode ??= FocusNode();

    _model.verificationController ??= TextEditingController();
    _model.verificationFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<VillasRecord>(
      stream: VillasRecord.getDocument(widget.placeRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: const Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black,
                  ),
                ),
              ),
            ),
          );
        }
        final villasBookingDetailsVillasRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          22.0, 0.0, 0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          villasBookingDetailsVillasRecord
                                              .phoUrl,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.886,
                                          height: 228.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 0.0, 0.0),
                            child: Text(
                              villasBookingDetailsVillasRecord.displayName,
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    fontSize: 20.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 8.0, 0.0, 0.0),
                            child: Text(
                              villasBookingDetailsVillasRecord.location,
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Your Earning',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            Text(
                              formatNumber(
                                functions.getEmployeeEarning(
                                    functions
                                        .calculateBasePrice(
                                            villasBookingDetailsVillasRecord
                                                .price,
                                            widget.startDate!,
                                            widget.endDate!)!
                                        .toDouble(),
                                    villasBookingDetailsVillasRecord.employeePer
                                        .toDouble()),
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.automatic,
                                currency: '₹',
                              ),
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Check in date',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            Text(
                              dateTimeFormat('yMMMd', widget.startDate),
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 24.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Check out date',
                              style: FlutterFlowTheme.of(context).labelMedium,
                            ),
                            Text(
                              dateTimeFormat('yMMMd', widget.endDate),
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 12.0, 24.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Total',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Text(
                                formatNumber(
                                  functions.calculateBasePrice(
                                      villasBookingDetailsVillasRecord.price,
                                      widget.startDate!,
                                      widget.endDate!),
                                  formatType: FormatType.custom,
                                  currency: '₹',
                                  format: '',
                                  locale: '',
                                ),
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Opacity(
                        opacity: 0.4,
                        child: Divider(
                          thickness: 1.0,
                          color: Color(0xFF747373),
                        ),
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Fill the guest details',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 10.0, 24.0, 0.0),
                                child: TextFormField(
                                  controller: _model.nameController,
                                  focusNode: _model.nameFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '        Guest Name (Any one)',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  validator: _model.nameControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 5.0, 0.0, 0.0),
                                      child: FlutterFlowChoiceChips(
                                        options: const [
                                          ChipData('Male', Icons.male_outlined),
                                          ChipData('Female', Icons.female_sharp)
                                        ],
                                        onChanged: (val) => setState(() =>
                                            _model.choiceChipsValue =
                                                val?.first),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .lineColor,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                          iconColor: const Color(0xFF606060),
                                          iconSize: 18.0,
                                          elevation: 2.0,
                                          borderColor: const Color(0xFF464646),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor: const Color(0xFFD0D0D0),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          iconSize: 18.0,
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        chipSpacing: 12.0,
                                        rowSpacing: 12.0,
                                        multiselect: false,
                                        alignment: WrapAlignment.start,
                                        controller: _model
                                                .choiceChipsValueController ??=
                                            FormFieldController<List<String>>(
                                          [],
                                        ),
                                        wrapped: true,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 10.0, 24.0, 0.0),
                                      child: TextFormField(
                                        controller: _model.ageController,
                                        focusNode: _model.ageFocusNode,
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Age',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        keyboardType: TextInputType.number,
                                        validator: _model.ageControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 10.0, 24.0, 0.0),
                                child: TextFormField(
                                  controller: _model.contactController,
                                  focusNode: _model.contactFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '        Contact Number',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Plus Jakarta Sans',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  maxLength: 10,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.none,
                                  buildCounter: (context,
                                          {required currentLength,
                                          required isFocused,
                                          maxLength}) =>
                                      null,
                                  keyboardType: TextInputType.number,
                                  validator: _model.contactControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 10.0, 24.0, 0.0),
                                child: TextFormField(
                                  controller: _model.verificationController,
                                  focusNode: _model.verificationFocusNode,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: '        Verifcation ID',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model
                                      .verificationControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          40.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Total Adult',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Container(
                                          width: 160.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: FlutterFlowCountController(
                                            decrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.minus,
                                              color: enabled
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 20.0,
                                            ),
                                            incrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.plus,
                                              color: enabled
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 20.0,
                                            ),
                                            countBuilder: (count) => Text(
                                              count.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge,
                                            ),
                                            count: _model
                                                .countControlleradultValue ??= 0,
                                            updateCount: (count) async {
                                              setState(() => _model
                                                      .countControlleradultValue =
                                                  count);
                                              if (_model
                                                      .countControlleradultValue! <
                                                  0) {
                                                setState(() {
                                                  _model.countControlleradultValue =
                                                      0;
                                                });
                                              } else {
                                                if (_model
                                                        .countControlleradultValue! >
                                                    villasBookingDetailsVillasRecord
                                                        .maxAdult) {
                                                  setState(() {
                                                    _model.countControlleradultValue =
                                                        villasBookingDetailsVillasRecord
                                                            .maxAdult;
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Your have reached the max adult Limit',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 2350),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                    ),
                                                  );
                                                }
                                              }
                                            },
                                            stepSize: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          40.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Total Children',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Container(
                                          width: 160.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            shape: BoxShape.rectangle,
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: FlutterFlowCountController(
                                            decrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.minus,
                                              color: enabled
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 20.0,
                                            ),
                                            incrementIconBuilder: (enabled) =>
                                                FaIcon(
                                              FontAwesomeIcons.plus,
                                              color: enabled
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 20.0,
                                            ),
                                            countBuilder: (count) => Text(
                                              count.toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge,
                                            ),
                                            count: _model
                                                .countControllerchildrenValue ??= 0,
                                            updateCount: (count) async {
                                              setState(() => _model
                                                      .countControllerchildrenValue =
                                                  count);
                                              if (_model
                                                      .countControllerchildrenValue! <
                                                  0) {
                                                setState(() {
                                                  _model.countControllerchildrenValue =
                                                      0;
                                                });
                                              } else {
                                                if (_model
                                                        .countControllerchildrenValue! >
                                                    villasBookingDetailsVillasRecord
                                                        .maxChildren) {
                                                  setState(() {
                                                    _model.countControllerchildrenValue =
                                                        villasBookingDetailsVillasRecord
                                                            .maxChildren;
                                                  });
                                                  ScaffoldMessenger.of(context)
                                                      .clearSnackBars();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Your have reached the max children Limit',
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          milliseconds: 2849),
                                                      backgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                    ),
                                                  );
                                                }
                                              }
                                            },
                                            stepSize: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<AdminLogincodeRecord>>(
                    stream: queryAdminLogincodeRecord(
                      singleRecord: true,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return const Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.black,
                              ),
                            ),
                          ),
                        );
                      }
                      List<AdminLogincodeRecord>
                          bottomButtonAreaAdminLogincodeRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final bottomButtonAreaAdminLogincodeRecord =
                          bottomButtonAreaAdminLogincodeRecordList.isNotEmpty
                              ? bottomButtonAreaAdminLogincodeRecordList.first
                              : null;
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x55000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                        ),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }

                            await BookingsRecord.createDoc(
                                    currentUserReference!)
                                .set(createBookingsRecordData(
                              placeRef: widget.placeRef,
                              startDate: widget.startDate,
                              endDate: widget.endDate,
                              price: functions.calculateBasePrice(
                                  villasBookingDetailsVillasRecord.price,
                                  widget.startDate!,
                                  widget.endDate!),
                              placeStringRef: widget.placeRef?.id,
                              name:
                                  villasBookingDetailsVillasRecord.displayName,
                              location:
                                  villasBookingDetailsVillasRecord.location,
                              earnings: functions.getEmployeeEarning(
                                  functions
                                      .calculateBasePrice(
                                          villasBookingDetailsVillasRecord
                                              .price,
                                          widget.startDate!,
                                          widget.endDate!)!
                                      .toDouble(),
                                  villasBookingDetailsVillasRecord.employeePer
                                      .toDouble()),
                              createdTime: getCurrentTimestamp,
                              maxAdult: _model.countControlleradultValue,
                              maxChildren: _model.countControllerchildrenValue,
                              contactInfo:
                                  int.tryParse(_model.nameController.text),
                              verificationID: int.tryParse(
                                  _model.verificationController.text),
                              firstname: _model.nameController.text,
                              employeeName: currentUserDisplayName,
                              employeeLastname: valueOrDefault(
                                  currentUserDocument?.lastName, ''),
                              profit: functions.getProfit(
                                  functions
                                      .calculateBasePrice(
                                          villasBookingDetailsVillasRecord
                                              .price,
                                          widget.startDate!,
                                          widget.endDate!)!
                                      .toDouble(),
                                  functions.getEmployeeEarning(
                                      functions
                                          .calculateBasePrice(
                                              villasBookingDetailsVillasRecord
                                                  .price,
                                              widget.startDate!,
                                              widget.endDate!)!
                                          .toDouble(),
                                      villasBookingDetailsVillasRecord
                                          .employeePer
                                          .toDouble())),
                              age: int.tryParse(_model.ageController.text),
                              gender: _model.choiceChipsValue,
                            ));

                            await TotalBookingRecord.collection
                                .doc()
                                .set(createTotalBookingRecordData(
                                  nameofVilla: villasBookingDetailsVillasRecord
                                      .displayName,
                                  price: functions
                                      .calculateBasePrice(
                                          villasBookingDetailsVillasRecord
                                              .price,
                                          widget.startDate!,
                                          widget.endDate!)
                                      ?.toDouble(),
                                  employeeCommision: functions.getEmployeeEarning(
                                      functions
                                          .calculateBasePrice(
                                              villasBookingDetailsVillasRecord
                                                  .price,
                                              widget.startDate!,
                                              widget.endDate!)!
                                          .toDouble(),
                                      villasBookingDetailsVillasRecord
                                          .employeePer
                                          .toDouble()),
                                  startDate: widget.startDate,
                                  endDate: widget.endDate,
                                  employeeName: currentUserDisplayName,
                                  emplastName: valueOrDefault(
                                      currentUserDocument?.lastName, ''),
                                  profit: functions.getProfit(
                                      functions
                                          .calculateBasePrice(
                                              villasBookingDetailsVillasRecord
                                                  .price,
                                              widget.startDate!,
                                              widget.endDate!)!
                                          .toDouble(),
                                      functions.getEmployeeEarning(
                                          functions
                                              .calculateBasePrice(
                                                  villasBookingDetailsVillasRecord
                                                      .price,
                                                  widget.startDate!,
                                                  widget.endDate!)!
                                              .toDouble(),
                                          villasBookingDetailsVillasRecord
                                              .employeePer
                                              .toDouble())),
                                  placeRef: widget.placeRef,
                                  leadGuest: _model.nameController.text,
                                  contactinfo: int.tryParse(
                                      _model.contactController.text),
                                  verificationID: int.tryParse(
                                      _model.verificationController.text),
                                  location:
                                      villasBookingDetailsVillasRecord.location,
                                  maxAdult: _model.countControlleradultValue,
                                  maxChildren:
                                      _model.countControllerchildrenValue,
                                  age: int.tryParse(_model.ageController.text),
                                  gender: _model.choiceChipsValue,
                                  createdtime: getCurrentTimestamp,
                                ));

                            await bottomButtonAreaAdminLogincodeRecord!
                                .reference
                                .update({
                              ...mapToFirestore(
                                {
                                  'sales': FieldValue.increment(functions
                                      .calculateBasePrice(
                                          villasBookingDetailsVillasRecord
                                              .price,
                                          widget.startDate!,
                                          widget.endDate!)!
                                      .toDouble()),
                                  'profit': FieldValue.increment(functions.getProfit(
                                      functions
                                          .calculateBasePrice(
                                              villasBookingDetailsVillasRecord
                                                  .price,
                                              widget.startDate!,
                                              widget.endDate!)!
                                          .toDouble(),
                                      functions.getEmployeeEarning(
                                          functions
                                              .calculateBasePrice(
                                                  villasBookingDetailsVillasRecord
                                                      .price,
                                                  widget.startDate!,
                                                  widget.endDate!)!
                                              .toDouble(),
                                          villasBookingDetailsVillasRecord
                                              .employeePer
                                              .toDouble()))!),
                                },
                              ),
                            });

                            await currentUserReference!.update({
                              ...mapToFirestore(
                                {
                                  'earnings': FieldValue.increment(
                                      functions.getEmployeeEarning(
                                          functions
                                              .calculateBasePrice(
                                                  villasBookingDetailsVillasRecord
                                                      .price,
                                                  widget.startDate!,
                                                  widget.endDate!)!
                                              .toDouble(),
                                          villasBookingDetailsVillasRecord
                                              .employeePer
                                              .toDouble())),
                                },
                              ),
                            });

                            context.pushNamed(
                              'bookingconfirmed',
                              queryParameters: {
                                'placeRef': serializeParam(
                                  widget.placeRef,
                                  ParamType.DocumentReference,
                                ),
                                'startDate': serializeParam(
                                  widget.startDate,
                                  ParamType.DateTime,
                                ),
                                'endDate': serializeParam(
                                  widget.endDate,
                                  ParamType.DateTime,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Book Now',
                          options: FFButtonOptions(
                            width: 65.0,
                            height: 60.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Colors.black,
                            textStyle: FlutterFlowTheme.of(context)
                                .displaySmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 20.0,
                                ),
                            elevation: 0.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
