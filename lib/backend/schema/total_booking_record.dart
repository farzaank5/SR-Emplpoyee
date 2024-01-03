import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TotalBookingRecord extends FirestoreRecord {
  TotalBookingRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nameofVilla" field.
  String? _nameofVilla;
  String get nameofVilla => _nameofVilla ?? '';
  bool hasNameofVilla() => _nameofVilla != null;

  // "Price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "employeeCommision" field.
  double? _employeeCommision;
  double get employeeCommision => _employeeCommision ?? 0.0;
  bool hasEmployeeCommision() => _employeeCommision != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "placeRef" field.
  DocumentReference? _placeRef;
  DocumentReference? get placeRef => _placeRef;
  bool hasPlaceRef() => _placeRef != null;

  // "empRef" field.
  DocumentReference? _empRef;
  DocumentReference? get empRef => _empRef;
  bool hasEmpRef() => _empRef != null;

  // "employeeName" field.
  String? _employeeName;
  String get employeeName => _employeeName ?? '';
  bool hasEmployeeName() => _employeeName != null;

  // "emplastName" field.
  String? _emplastName;
  String get emplastName => _emplastName ?? '';
  bool hasEmplastName() => _emplastName != null;

  // "lead_guest" field.
  String? _leadGuest;
  String get leadGuest => _leadGuest ?? '';
  bool hasLeadGuest() => _leadGuest != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "contactinfo" field.
  int? _contactinfo;
  int get contactinfo => _contactinfo ?? 0;
  bool hasContactinfo() => _contactinfo != null;

  // "verificationID" field.
  int? _verificationID;
  int get verificationID => _verificationID ?? 0;
  bool hasVerificationID() => _verificationID != null;

  // "profit" field.
  double? _profit;
  double get profit => _profit ?? 0.0;
  bool hasProfit() => _profit != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "max_adult" field.
  int? _maxAdult;
  int get maxAdult => _maxAdult ?? 0;
  bool hasMaxAdult() => _maxAdult != null;

  // "max_children" field.
  int? _maxChildren;
  int get maxChildren => _maxChildren ?? 0;
  bool hasMaxChildren() => _maxChildren != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "createdtime" field.
  DateTime? _createdtime;
  DateTime? get createdtime => _createdtime;
  bool hasCreatedtime() => _createdtime != null;

  void _initializeFields() {
    _nameofVilla = snapshotData['nameofVilla'] as String?;
    _price = castToType<double>(snapshotData['Price']);
    _employeeCommision = castToType<double>(snapshotData['employeeCommision']);
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
    _placeRef = snapshotData['placeRef'] as DocumentReference?;
    _empRef = snapshotData['empRef'] as DocumentReference?;
    _employeeName = snapshotData['employeeName'] as String?;
    _emplastName = snapshotData['emplastName'] as String?;
    _leadGuest = snapshotData['lead_guest'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _contactinfo = castToType<int>(snapshotData['contactinfo']);
    _verificationID = castToType<int>(snapshotData['verificationID']);
    _profit = castToType<double>(snapshotData['profit']);
    _location = snapshotData['location'] as String?;
    _maxAdult = castToType<int>(snapshotData['max_adult']);
    _maxChildren = castToType<int>(snapshotData['max_children']);
    _gender = snapshotData['gender'] as String?;
    _createdtime = snapshotData['createdtime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('totalBooking');

  static Stream<TotalBookingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TotalBookingRecord.fromSnapshot(s));

  static Future<TotalBookingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TotalBookingRecord.fromSnapshot(s));

  static TotalBookingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TotalBookingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TotalBookingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TotalBookingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TotalBookingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TotalBookingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTotalBookingRecordData({
  String? nameofVilla,
  double? price,
  double? employeeCommision,
  DateTime? startDate,
  DateTime? endDate,
  DocumentReference? placeRef,
  DocumentReference? empRef,
  String? employeeName,
  String? emplastName,
  String? leadGuest,
  int? age,
  int? contactinfo,
  int? verificationID,
  double? profit,
  String? location,
  int? maxAdult,
  int? maxChildren,
  String? gender,
  DateTime? createdtime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nameofVilla': nameofVilla,
      'Price': price,
      'employeeCommision': employeeCommision,
      'startDate': startDate,
      'endDate': endDate,
      'placeRef': placeRef,
      'empRef': empRef,
      'employeeName': employeeName,
      'emplastName': emplastName,
      'lead_guest': leadGuest,
      'age': age,
      'contactinfo': contactinfo,
      'verificationID': verificationID,
      'profit': profit,
      'location': location,
      'max_adult': maxAdult,
      'max_children': maxChildren,
      'gender': gender,
      'createdtime': createdtime,
    }.withoutNulls,
  );

  return firestoreData;
}

class TotalBookingRecordDocumentEquality
    implements Equality<TotalBookingRecord> {
  const TotalBookingRecordDocumentEquality();

  @override
  bool equals(TotalBookingRecord? e1, TotalBookingRecord? e2) {
    return e1?.nameofVilla == e2?.nameofVilla &&
        e1?.price == e2?.price &&
        e1?.employeeCommision == e2?.employeeCommision &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.placeRef == e2?.placeRef &&
        e1?.empRef == e2?.empRef &&
        e1?.employeeName == e2?.employeeName &&
        e1?.emplastName == e2?.emplastName &&
        e1?.leadGuest == e2?.leadGuest &&
        e1?.age == e2?.age &&
        e1?.contactinfo == e2?.contactinfo &&
        e1?.verificationID == e2?.verificationID &&
        e1?.profit == e2?.profit &&
        e1?.location == e2?.location &&
        e1?.maxAdult == e2?.maxAdult &&
        e1?.maxChildren == e2?.maxChildren &&
        e1?.gender == e2?.gender &&
        e1?.createdtime == e2?.createdtime;
  }

  @override
  int hash(TotalBookingRecord? e) => const ListEquality().hash([
        e?.nameofVilla,
        e?.price,
        e?.employeeCommision,
        e?.startDate,
        e?.endDate,
        e?.placeRef,
        e?.empRef,
        e?.employeeName,
        e?.emplastName,
        e?.leadGuest,
        e?.age,
        e?.contactinfo,
        e?.verificationID,
        e?.profit,
        e?.location,
        e?.maxAdult,
        e?.maxChildren,
        e?.gender,
        e?.createdtime
      ]);

  @override
  bool isValidKey(Object? o) => o is TotalBookingRecord;
}
