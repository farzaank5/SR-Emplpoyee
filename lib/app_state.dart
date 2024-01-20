import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  DateTime? _EndDate = DateTime.fromMillisecondsSinceEpoch(1694673000000);
  DateTime? get EndDate => _EndDate;
  set EndDate(DateTime? _value) {
    _EndDate = _value;
  }

  DateTime? _startDate = DateTime.fromMillisecondsSinceEpoch(1693549800000);
  DateTime? get startDate => _startDate;
  set startDate(DateTime? _value) {
    _startDate = _value;
  }

  double _monthlyearning = 0.0;
  double get monthlyearning => _monthlyearning;
  set monthlyearning(double _value) {
    _monthlyearning = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
