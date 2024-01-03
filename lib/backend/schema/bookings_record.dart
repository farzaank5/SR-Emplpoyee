import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "placeRef" field.
  DocumentReference? _placeRef;
  DocumentReference? get placeRef => _placeRef;
  bool hasPlaceRef() => _placeRef != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "Price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "placeStringRef" field.
  String? _placeStringRef;
  String get placeStringRef => _placeStringRef ?? '';
  bool hasPlaceStringRef() => _placeStringRef != null;

  // "firstname" field.
  String? _firstname;
  String get firstname => _firstname ?? '';
  bool hasFirstname() => _firstname != null;

  // "earnings" field.
  double? _earnings;
  double get earnings => _earnings ?? 0.0;
  bool hasEarnings() => _earnings != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "max_adult" field.
  int? _maxAdult;
  int get maxAdult => _maxAdult ?? 0;
  bool hasMaxAdult() => _maxAdult != null;

  // "max_children" field.
  int? _maxChildren;
  int get maxChildren => _maxChildren ?? 0;
  bool hasMaxChildren() => _maxChildren != null;

  // "contactInfo" field.
  int? _contactInfo;
  int get contactInfo => _contactInfo ?? 0;
  bool hasContactInfo() => _contactInfo != null;

  // "VerificationID" field.
  int? _verificationID;
  int get verificationID => _verificationID ?? 0;
  bool hasVerificationID() => _verificationID != null;

  // "employee_name" field.
  String? _employeeName;
  String get employeeName => _employeeName ?? '';
  bool hasEmployeeName() => _employeeName != null;

  // "employee_lastname" field.
  String? _employeeLastname;
  String get employeeLastname => _employeeLastname ?? '';
  bool hasEmployeeLastname() => _employeeLastname != null;

  // "profit" field.
  double? _profit;
  double get profit => _profit ?? 0.0;
  bool hasProfit() => _profit != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _placeRef = snapshotData['placeRef'] as DocumentReference?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as String?;
    _price = castToType<int>(snapshotData['Price']);
    _placeStringRef = snapshotData['placeStringRef'] as String?;
    _firstname = snapshotData['firstname'] as String?;
    _earnings = castToType<double>(snapshotData['earnings']);
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _maxAdult = castToType<int>(snapshotData['max_adult']);
    _maxChildren = castToType<int>(snapshotData['max_children']);
    _contactInfo = castToType<int>(snapshotData['contactInfo']);
    _verificationID = castToType<int>(snapshotData['VerificationID']);
    _employeeName = snapshotData['employee_name'] as String?;
    _employeeLastname = snapshotData['employee_lastname'] as String?;
    _profit = castToType<double>(snapshotData['profit']);
    _age = castToType<int>(snapshotData['age']);
    _gender = snapshotData['gender'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bookings')
          : FirebaseFirestore.instance.collectionGroup('bookings');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('bookings').doc();

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingsRecordData({
  DocumentReference? placeRef,
  DateTime? startDate,
  DateTime? endDate,
  String? name,
  String? location,
  int? price,
  String? placeStringRef,
  String? firstname,
  double? earnings,
  DateTime? createdTime,
  int? maxAdult,
  int? maxChildren,
  int? contactInfo,
  int? verificationID,
  String? employeeName,
  String? employeeLastname,
  double? profit,
  int? age,
  String? gender,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'placeRef': placeRef,
      'startDate': startDate,
      'endDate': endDate,
      'name': name,
      'location': location,
      'Price': price,
      'placeStringRef': placeStringRef,
      'firstname': firstname,
      'earnings': earnings,
      'createdTime': createdTime,
      'max_adult': maxAdult,
      'max_children': maxChildren,
      'contactInfo': contactInfo,
      'VerificationID': verificationID,
      'employee_name': employeeName,
      'employee_lastname': employeeLastname,
      'profit': profit,
      'age': age,
      'gender': gender,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingsRecordDocumentEquality implements Equality<BookingsRecord> {
  const BookingsRecordDocumentEquality();

  @override
  bool equals(BookingsRecord? e1, BookingsRecord? e2) {
    return e1?.placeRef == e2?.placeRef &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.price == e2?.price &&
        e1?.placeStringRef == e2?.placeStringRef &&
        e1?.firstname == e2?.firstname &&
        e1?.earnings == e2?.earnings &&
        e1?.createdTime == e2?.createdTime &&
        e1?.maxAdult == e2?.maxAdult &&
        e1?.maxChildren == e2?.maxChildren &&
        e1?.contactInfo == e2?.contactInfo &&
        e1?.verificationID == e2?.verificationID &&
        e1?.employeeName == e2?.employeeName &&
        e1?.employeeLastname == e2?.employeeLastname &&
        e1?.profit == e2?.profit &&
        e1?.age == e2?.age &&
        e1?.gender == e2?.gender;
  }

  @override
  int hash(BookingsRecord? e) => const ListEquality().hash([
        e?.placeRef,
        e?.startDate,
        e?.endDate,
        e?.name,
        e?.location,
        e?.price,
        e?.placeStringRef,
        e?.firstname,
        e?.earnings,
        e?.createdTime,
        e?.maxAdult,
        e?.maxChildren,
        e?.contactInfo,
        e?.verificationID,
        e?.employeeName,
        e?.employeeLastname,
        e?.profit,
        e?.age,
        e?.gender
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingsRecord;
}
