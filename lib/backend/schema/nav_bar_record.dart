import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NavBarRecord extends FirestoreRecord {
  NavBarRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "page" field.
  String? _page;
  String get page => _page ?? '';
  bool hasPage() => _page != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "isLink" field.
  bool? _isLink;
  bool get isLink => _isLink ?? false;
  bool hasIsLink() => _isLink != null;

  // "urlPage" field.
  String? _urlPage;
  String get urlPage => _urlPage ?? '';
  bool hasUrlPage() => _urlPage != null;

  void _initializeFields() {
    _order = castToType<int>(snapshotData['order']);
    _name = snapshotData['name'] as String?;
    _page = snapshotData['page'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _isLink = snapshotData['isLink'] as bool?;
    _urlPage = snapshotData['urlPage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('NavBar');

  static Stream<NavBarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NavBarRecord.fromSnapshot(s));

  static Future<NavBarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NavBarRecord.fromSnapshot(s));

  static NavBarRecord fromSnapshot(DocumentSnapshot snapshot) => NavBarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NavBarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NavBarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NavBarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NavBarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNavBarRecordData({
  int? order,
  String? name,
  String? page,
  bool? isActive,
  bool? isLink,
  String? urlPage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order': order,
      'name': name,
      'page': page,
      'isActive': isActive,
      'isLink': isLink,
      'urlPage': urlPage,
    }.withoutNulls,
  );

  return firestoreData;
}

class NavBarRecordDocumentEquality implements Equality<NavBarRecord> {
  const NavBarRecordDocumentEquality();

  @override
  bool equals(NavBarRecord? e1, NavBarRecord? e2) {
    return e1?.order == e2?.order &&
        e1?.name == e2?.name &&
        e1?.page == e2?.page &&
        e1?.isActive == e2?.isActive &&
        e1?.isLink == e2?.isLink &&
        e1?.urlPage == e2?.urlPage;
  }

  @override
  int hash(NavBarRecord? e) => const ListEquality()
      .hash([e?.order, e?.name, e?.page, e?.isActive, e?.isLink, e?.urlPage]);

  @override
  bool isValidKey(Object? o) => o is NavBarRecord;
}
