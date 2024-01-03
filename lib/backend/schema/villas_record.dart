import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VillasRecord extends FirestoreRecord {
  VillasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "max_adult" field.
  int? _maxAdult;
  int get maxAdult => _maxAdult ?? 0;
  bool hasMaxAdult() => _maxAdult != null;

  // "max_children" field.
  int? _maxChildren;
  int get maxChildren => _maxChildren ?? 0;
  bool hasMaxChildren() => _maxChildren != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "employeePer" field.
  int? _employeePer;
  int get employeePer => _employeePer ?? 0;
  bool hasEmployeePer() => _employeePer != null;

  // "pho_url" field.
  String? _phoUrl;
  String get phoUrl => _phoUrl ?? '';
  bool hasPhoUrl() => _phoUrl != null;

  // "placeRef" field.
  String? _placeRef;
  String get placeRef => _placeRef ?? '';
  bool hasPlaceRef() => _placeRef != null;

  void _initializeFields() {
    _maxAdult = castToType<int>(snapshotData['max_adult']);
    _maxChildren = castToType<int>(snapshotData['max_children']);
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _location = snapshotData['Location'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _employeePer = castToType<int>(snapshotData['employeePer']);
    _phoUrl = snapshotData['pho_url'] as String?;
    _placeRef = snapshotData['placeRef'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('villas');

  static Stream<VillasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VillasRecord.fromSnapshot(s));

  static Future<VillasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VillasRecord.fromSnapshot(s));

  static VillasRecord fromSnapshot(DocumentSnapshot snapshot) => VillasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VillasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VillasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VillasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VillasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVillasRecordData({
  int? maxAdult,
  int? maxChildren,
  String? uid,
  DateTime? createdTime,
  String? location,
  String? displayName,
  int? price,
  int? employeePer,
  String? phoUrl,
  String? placeRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'max_adult': maxAdult,
      'max_children': maxChildren,
      'uid': uid,
      'created_time': createdTime,
      'Location': location,
      'display_name': displayName,
      'price': price,
      'employeePer': employeePer,
      'pho_url': phoUrl,
      'placeRef': placeRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class VillasRecordDocumentEquality implements Equality<VillasRecord> {
  const VillasRecordDocumentEquality();

  @override
  bool equals(VillasRecord? e1, VillasRecord? e2) {
    return e1?.maxAdult == e2?.maxAdult &&
        e1?.maxChildren == e2?.maxChildren &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.location == e2?.location &&
        e1?.displayName == e2?.displayName &&
        e1?.price == e2?.price &&
        e1?.employeePer == e2?.employeePer &&
        e1?.phoUrl == e2?.phoUrl &&
        e1?.placeRef == e2?.placeRef;
  }

  @override
  int hash(VillasRecord? e) => const ListEquality().hash([
        e?.maxAdult,
        e?.maxChildren,
        e?.uid,
        e?.createdTime,
        e?.location,
        e?.displayName,
        e?.price,
        e?.employeePer,
        e?.phoUrl,
        e?.placeRef
      ]);

  @override
  bool isValidKey(Object? o) => o is VillasRecord;
}
