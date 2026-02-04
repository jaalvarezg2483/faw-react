import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CaracteristicasRecord extends FirestoreRecord {
  CaracteristicasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _order = castToType<int>(snapshotData['order']);
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _url = snapshotData['url'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('caracteristicas')
          : FirebaseFirestore.instance.collectionGroup('caracteristicas');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('caracteristicas').doc(id);

  static Stream<CaracteristicasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CaracteristicasRecord.fromSnapshot(s));

  static Future<CaracteristicasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CaracteristicasRecord.fromSnapshot(s));

  static CaracteristicasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CaracteristicasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CaracteristicasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CaracteristicasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CaracteristicasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CaracteristicasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCaracteristicasRecordData({
  int? order,
  String? title,
  String? description,
  String? url,
  bool? isActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order': order,
      'title': title,
      'description': description,
      'url': url,
      'isActive': isActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class CaracteristicasRecordDocumentEquality
    implements Equality<CaracteristicasRecord> {
  const CaracteristicasRecordDocumentEquality();

  @override
  bool equals(CaracteristicasRecord? e1, CaracteristicasRecord? e2) {
    return e1?.order == e2?.order &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.url == e2?.url &&
        e1?.isActive == e2?.isActive;
  }

  @override
  int hash(CaracteristicasRecord? e) => const ListEquality()
      .hash([e?.order, e?.title, e?.description, e?.url, e?.isActive]);

  @override
  bool isValidKey(Object? o) => o is CaracteristicasRecord;
}
