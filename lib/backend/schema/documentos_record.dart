import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocumentosRecord extends FirestoreRecord {
  DocumentosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "section" field.
  String? _section;
  String get section => _section ?? '';
  bool hasSection() => _section != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "enable" field.
  bool? _enable;
  bool get enable => _enable ?? false;
  bool hasEnable() => _enable != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _section = snapshotData['section'] as String?;
    _url = snapshotData['url'] as String?;
    _enable = snapshotData['enable'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Documentos');

  static Stream<DocumentosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocumentosRecord.fromSnapshot(s));

  static Future<DocumentosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocumentosRecord.fromSnapshot(s));

  static DocumentosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DocumentosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocumentosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocumentosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocumentosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocumentosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocumentosRecordData({
  String? name,
  String? section,
  String? url,
  bool? enable,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'section': section,
      'url': url,
      'enable': enable,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocumentosRecordDocumentEquality implements Equality<DocumentosRecord> {
  const DocumentosRecordDocumentEquality();

  @override
  bool equals(DocumentosRecord? e1, DocumentosRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.section == e2?.section &&
        e1?.url == e2?.url &&
        e1?.enable == e2?.enable;
  }

  @override
  int hash(DocumentosRecord? e) =>
      const ListEquality().hash([e?.name, e?.section, e?.url, e?.enable]);

  @override
  bool isValidKey(Object? o) => o is DocumentosRecord;
}
