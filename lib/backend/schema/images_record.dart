import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImagesRecord extends FirestoreRecord {
  ImagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _url = snapshotData['url'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('images')
          : FirebaseFirestore.instance.collectionGroup('images');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('images').doc(id);

  static Stream<ImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ImagesRecord.fromSnapshot(s));

  static Future<ImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ImagesRecord.fromSnapshot(s));

  static ImagesRecord fromSnapshot(DocumentSnapshot snapshot) => ImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createImagesRecordData({
  String? type,
  bool? isActive,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'isActive': isActive,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class ImagesRecordDocumentEquality implements Equality<ImagesRecord> {
  const ImagesRecordDocumentEquality();

  @override
  bool equals(ImagesRecord? e1, ImagesRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.isActive == e2?.isActive &&
        e1?.url == e2?.url;
  }

  @override
  int hash(ImagesRecord? e) =>
      const ListEquality().hash([e?.type, e?.isActive, e?.url]);

  @override
  bool isValidKey(Object? o) => o is ImagesRecord;
}
