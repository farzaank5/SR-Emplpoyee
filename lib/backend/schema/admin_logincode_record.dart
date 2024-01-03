import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminLogincodeRecord extends FirestoreRecord {
  AdminLogincodeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "login_code" field.
  int? _loginCode;
  int get loginCode => _loginCode ?? 0;
  bool hasLoginCode() => _loginCode != null;

  // "sales" field.
  double? _sales;
  double get sales => _sales ?? 0.0;
  bool hasSales() => _sales != null;

  // "profit" field.
  double? _profit;
  double get profit => _profit ?? 0.0;
  bool hasProfit() => _profit != null;

  void _initializeFields() {
    _loginCode = castToType<int>(snapshotData['login_code']);
    _sales = castToType<double>(snapshotData['sales']);
    _profit = castToType<double>(snapshotData['profit']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('admin_logincode');

  static Stream<AdminLogincodeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminLogincodeRecord.fromSnapshot(s));

  static Future<AdminLogincodeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminLogincodeRecord.fromSnapshot(s));

  static AdminLogincodeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminLogincodeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminLogincodeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminLogincodeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminLogincodeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminLogincodeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminLogincodeRecordData({
  int? loginCode,
  double? sales,
  double? profit,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'login_code': loginCode,
      'sales': sales,
      'profit': profit,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminLogincodeRecordDocumentEquality
    implements Equality<AdminLogincodeRecord> {
  const AdminLogincodeRecordDocumentEquality();

  @override
  bool equals(AdminLogincodeRecord? e1, AdminLogincodeRecord? e2) {
    return e1?.loginCode == e2?.loginCode &&
        e1?.sales == e2?.sales &&
        e1?.profit == e2?.profit;
  }

  @override
  int hash(AdminLogincodeRecord? e) =>
      const ListEquality().hash([e?.loginCode, e?.sales, e?.profit]);

  @override
  bool isValidKey(Object? o) => o is AdminLogincodeRecord;
}
