import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FooterRecord extends FirestoreRecord {
  FooterRecord._(
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

  // "isLink" field.
  bool? _isLink;
  bool get isLink => _isLink ?? false;
  bool hasIsLink() => _isLink != null;

  // "enable" field.
  bool? _enable;
  bool get enable => _enable ?? false;
  bool hasEnable() => _enable != null;

  // "page" field.
  String? _page;
  String get page => _page ?? '';
  bool hasPage() => _page != null;

  // "urlLink" field.
  String? _urlLink;
  String get urlLink => _urlLink ?? '';
  bool hasUrlLink() => _urlLink != null;

  void _initializeFields() {
    _order = castToType<int>(snapshotData['order']);
    _name = snapshotData['name'] as String?;
    _isLink = snapshotData['isLink'] as bool?;
    _enable = snapshotData['enable'] as bool?;
    _page = snapshotData['page'] as String?;
    _urlLink = snapshotData['urlLink'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Footer');

  static Stream<FooterRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FooterRecord.fromSnapshot(s));

  static Future<FooterRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FooterRecord.fromSnapshot(s));

  static FooterRecord fromSnapshot(DocumentSnapshot snapshot) => FooterRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FooterRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FooterRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FooterRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FooterRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFooterRecordData({
  int? order,
  String? name,
  bool? isLink,
  bool? enable,
  String? page,
  String? urlLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order': order,
      'name': name,
      'isLink': isLink,
      'enable': enable,
      'page': page,
      'urlLink': urlLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class FooterRecordDocumentEquality implements Equality<FooterRecord> {
  const FooterRecordDocumentEquality();

  @override
  bool equals(FooterRecord? e1, FooterRecord? e2) {
    return e1?.order == e2?.order &&
        e1?.name == e2?.name &&
        e1?.isLink == e2?.isLink &&
        e1?.enable == e2?.enable &&
        e1?.page == e2?.page &&
        e1?.urlLink == e2?.urlLink;
  }

  @override
  int hash(FooterRecord? e) => const ListEquality()
      .hash([e?.order, e?.name, e?.isLink, e?.enable, e?.page, e?.urlLink]);

  @override
  bool isValidKey(Object? o) => o is FooterRecord;
}
