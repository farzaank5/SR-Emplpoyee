// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<int>?> inbetweenselection(
  int? start,
  int? end,
) async {
  //  return  inbetween integer from start to end
  if (start == null || end == null) {
    return null;
  }

  List<int> result = [];

  if (start < end) {
    for (int i = start + 1; i <= end; i++) {
      result.add(i);
    }
  } else {
    for (int i = end + 1; i <= start; i++) {
      result.add(i);
    }
  }

  return result;
}
