import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GaleriaRecord extends FirestoreRecord {
  GaleriaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "isMain" field.
  bool? _isMain;
  bool get isMain => _isMain ?? false;
  bool hasIsMain() => _isMain != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _url = snapshotData['url'] as String?;
    _type = snapshotData['type'] as String?;
    _isMain = snapshotData['isMain'] as bool?;
    _isActive = snapshotData['isActive'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('galeria')
          : FirebaseFirestore.instance.collectionGroup('galeria');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('galeria').doc(id);

  static Stream<GaleriaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GaleriaRecord.fromSnapshot(s));

  static Future<GaleriaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GaleriaRecord.fromSnapshot(s));

  static GaleriaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GaleriaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GaleriaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GaleriaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GaleriaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GaleriaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGaleriaRecordData({
  String? url,
  String? type,
  bool? isMain,
  bool? isActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'url': url,
      'type': type,
      'isMain': isMain,
      'isActive': isActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class GaleriaRecordDocumentEquality implements Equality<GaleriaRecord> {
  const GaleriaRecordDocumentEquality();

  @override
  bool equals(GaleriaRecord? e1, GaleriaRecord? e2) {
    return e1?.url == e2?.url &&
        e1?.type == e2?.type &&
        e1?.isMain == e2?.isMain &&
        e1?.isActive == e2?.isActive;
  }

  @override
  int hash(GaleriaRecord? e) =>
      const ListEquality().hash([e?.url, e?.type, e?.isMain, e?.isActive]);

  @override
  bool isValidKey(Object? o) => o is GaleriaRecord;
}
