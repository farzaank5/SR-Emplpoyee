// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DateStruct extends FFFirebaseStruct {
  DateStruct({
    DateTime? datee,
    List<DateTime>? dtat,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _datee = datee,
        _dtat = dtat,
        super(firestoreUtilData);

  // "datee" field.
  DateTime? _datee;
  DateTime? get datee => _datee;
  set datee(DateTime? val) => _datee = val;
  bool hasDatee() => _datee != null;

  // "dtat" field.
  List<DateTime>? _dtat;
  List<DateTime> get dtat => _dtat ?? const [];
  set dtat(List<DateTime>? val) => _dtat = val;
  void updateDtat(Function(List<DateTime>) updateFn) => updateFn(_dtat ??= []);
  bool hasDtat() => _dtat != null;

  static DateStruct fromMap(Map<String, dynamic> data) => DateStruct(
        datee: data['datee'] as DateTime?,
        dtat: getDataList(data['dtat']),
      );

  static DateStruct? maybeFromMap(dynamic data) =>
      data is Map ? DateStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'datee': _datee,
        'dtat': _dtat,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'datee': serializeParam(
          _datee,
          ParamType.DateTime,
        ),
        'dtat': serializeParam(
          _dtat,
          ParamType.DateTime,
          true,
        ),
      }.withoutNulls;

  static DateStruct fromSerializableMap(Map<String, dynamic> data) =>
      DateStruct(
        datee: deserializeParam(
          data['datee'],
          ParamType.DateTime,
          false,
        ),
        dtat: deserializeParam<DateTime>(
          data['dtat'],
          ParamType.DateTime,
          true,
        ),
      );

  @override
  String toString() => 'DateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DateStruct &&
        datee == other.datee &&
        listEquality.equals(dtat, other.dtat);
  }

  @override
  int get hashCode => const ListEquality().hash([datee, dtat]);
}

DateStruct createDateStruct({
  DateTime? datee,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DateStruct(
      datee: datee,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DateStruct? updateDateStruct(
  DateStruct? date, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    date
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDateStructData(
  Map<String, dynamic> firestoreData,
  DateStruct? date,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (date == null) {
    return;
  }
  if (date.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && date.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dateData = getDateFirestoreData(date, forFieldValue);
  final nestedData = dateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = date.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDateFirestoreData(
  DateStruct? date, [
  bool forFieldValue = false,
]) {
  if (date == null) {
    return {};
  }
  final firestoreData = mapToFirestore(date.toMap());

  // Add any Firestore field values
  date.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDateListFirestoreData(
  List<DateStruct>? dates,
) =>
    dates?.map((e) => getDateFirestoreData(e, true)).toList() ?? [];
