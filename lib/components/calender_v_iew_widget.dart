import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calender_v_iew_model.dart';
export 'calender_v_iew_model.dart';

class CalenderVIewWidget extends StatefulWidget {
  const CalenderVIewWidget({
    Key? key,
    required this.startDate,
  }) : super(key: key);

  final bool? startDate;

  @override
  _CalenderVIewWidgetState createState() => _CalenderVIewWidgetState();
}

class _CalenderVIewWidgetState extends State<CalenderVIewWidget> {
  late CalenderVIewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalenderVIewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlutterFlowCalendar(
            color: Colors.black,
            iconColor: FlutterFlowTheme.of(context).secondaryText,
            weekFormat: false,
            weekStartsMonday: false,
            initialDate: getCurrentTimestamp,
            rowHeight: 64.0,
            onChange: (DateTimeRange? newSelectedDate) async {
              _model.calendarSelectedDay = newSelectedDate;
              if (widget.startDate!) {
                _model.updatePage(() {
                  FFAppState().startDate = _model.calendarSelectedDay?.start;
                });
              } else {
                _model.updatePage(() {
                  FFAppState().EndDate = _model.calendarSelectedDay?.end;
                });
              }

              setState(() {});
            },
            titleStyle: FlutterFlowTheme.of(context).headlineSmall,
            dayOfWeekStyle: FlutterFlowTheme.of(context).labelLarge,
            dateStyle: FlutterFlowTheme.of(context).bodyMedium,
            selectedDateStyle: FlutterFlowTheme.of(context).titleSmall,
            inactiveDateStyle: FlutterFlowTheme.of(context).labelMedium,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
            child: FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'Set Date',
              options: FFButtonOptions(
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Colors.black,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Plus Jakarta Sans',
                      color: Colors.white,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
