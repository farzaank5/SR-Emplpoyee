import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "bookmarks" field.
  List<DocumentReference>? _bookmarks;
  List<DocumentReference> get bookmarks => _bookmarks ?? const [];
  bool hasBookmarks() => _bookmarks != null;

  // "user_photo" field.
  String? _userPhoto;
  String get userPhoto => _userPhoto ?? '';
  bool hasUserPhoto() => _userPhoto != null;

  // "aadharnumber" field.
  int? _aadharnumber;
  int get aadharnumber => _aadharnumber ?? 0;
  bool hasAadharnumber() => _aadharnumber != null;

  // "earnings" field.
  double? _earnings;
  double get earnings => _earnings ?? 0.0;
  bool hasEarnings() => _earnings != null;

  // "loginpassword" field.
  String? _loginpassword;
  String get loginpassword => _loginpassword ?? '';
  bool hasLoginpassword() => _loginpassword != null;

  // "currentMonthEarning" field.
  double? _currentMonthEarning;
  double get currentMonthEarning => _currentMonthEarning ?? 0.0;
  bool hasCurrentMonthEarning() => _currentMonthEarning != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _bookmarks = getDataList(snapshotData['bookmarks']);
    _userPhoto = snapshotData['user_photo'] as String?;
    _aadharnumber = castToType<int>(snapshotData['aadharnumber']);
    _earnings = castToType<double>(snapshotData['earnings']);
    _loginpassword = snapshotData['loginpassword'] as String?;
    _currentMonthEarning =
        castToType<double>(snapshotData['currentMonthEarning']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? lastName,
  String? userPhoto,
  int? aadharnumber,
  double? earnings,
  String? loginpassword,
  double? currentMonthEarning,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'last_name': lastName,
      'user_photo': userPhoto,
      'aadharnumber': aadharnumber,
      'earnings': earnings,
      'loginpassword': loginpassword,
      'currentMonthEarning': currentMonthEarning,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.lastName == e2?.lastName &&
        listEquality.equals(e1?.bookmarks, e2?.bookmarks) &&
        e1?.userPhoto == e2?.userPhoto &&
        e1?.aadharnumber == e2?.aadharnumber &&
        e1?.earnings == e2?.earnings &&
        e1?.loginpassword == e2?.loginpassword &&
        e1?.currentMonthEarning == e2?.currentMonthEarning;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.lastName,
        e?.bookmarks,
        e?.userPhoto,
        e?.aadharnumber,
        e?.earnings,
        e?.loginpassword,
        e?.currentMonthEarning
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
