import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModelsRecord extends FirestoreRecord {
  ModelsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "urlImage" field.
  String? _urlImage;
  String get urlImage => _urlImage ?? '';
  bool hasUrlImage() => _urlImage != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "passengers" field.
  String? _passengers;
  String get passengers => _passengers ?? '';
  bool hasPassengers() => _passengers != null;

  // "transmission" field.
  String? _transmission;
  String get transmission => _transmission ?? '';
  bool hasTransmission() => _transmission != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "year" field.
  int? _year;
  int get year => _year ?? 0;
  bool hasYear() => _year != null;

  // "priceBase" field.
  int? _priceBase;
  int get priceBase => _priceBase ?? 0;
  bool hasPriceBase() => _priceBase != null;

  // "enable" field.
  bool? _enable;
  bool get enable => _enable ?? false;
  bool hasEnable() => _enable != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  void _initializeFields() {
    _urlImage = snapshotData['urlImage'] as String?;
    _name = snapshotData['name'] as String?;
    _passengers = snapshotData['passengers'] as String?;
    _transmission = snapshotData['transmission'] as String?;
    _code = snapshotData['code'] as String?;
    _year = castToType<int>(snapshotData['year']);
    _priceBase = castToType<int>(snapshotData['priceBase']);
    _enable = snapshotData['enable'] as bool?;
    _order = castToType<int>(snapshotData['order']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Models');

  static Stream<ModelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ModelsRecord.fromSnapshot(s));

  static Future<ModelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ModelsRecord.fromSnapshot(s));

  static ModelsRecord fromSnapshot(DocumentSnapshot snapshot) => ModelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ModelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ModelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ModelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ModelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createModelsRecordData({
  String? urlImage,
  String? name,
  String? passengers,
  String? transmission,
  String? code,
  int? year,
  int? priceBase,
  bool? enable,
  int? order,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'urlImage': urlImage,
      'name': name,
      'passengers': passengers,
      'transmission': transmission,
      'code': code,
      'year': year,
      'priceBase': priceBase,
      'enable': enable,
      'order': order,
    }.withoutNulls,
  );

  return firestoreData;
}

class ModelsRecordDocumentEquality implements Equality<ModelsRecord> {
  const ModelsRecordDocumentEquality();

  @override
  bool equals(ModelsRecord? e1, ModelsRecord? e2) {
    return e1?.urlImage == e2?.urlImage &&
        e1?.name == e2?.name &&
        e1?.passengers == e2?.passengers &&
        e1?.transmission == e2?.transmission &&
        e1?.code == e2?.code &&
        e1?.year == e2?.year &&
        e1?.priceBase == e2?.priceBase &&
        e1?.enable == e2?.enable &&
        e1?.order == e2?.order;
  }

  @override
  int hash(ModelsRecord? e) => const ListEquality().hash([
        e?.urlImage,
        e?.name,
        e?.passengers,
        e?.transmission,
        e?.code,
        e?.year,
        e?.priceBase,
        e?.enable,
        e?.order
      ]);

  @override
  bool isValidKey(Object? o) => o is ModelsRecord;
}
