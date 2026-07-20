import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaintenancePlansRecord extends FirestoreRecord {
  MaintenancePlansRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "planImageUrl" field.
  String? _planImageUrl;
  String get planImageUrl => _planImageUrl ?? '';
  bool hasPlanImageUrl() => _planImageUrl != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "enabled" field.
  bool? _enabled;
  bool get enabled => _enabled ?? false;
  bool hasEnabled() => _enabled != null;

  // "planImageUrl2" field.
  String? _planImageUrl2;
  String get planImageUrl2 => _planImageUrl2 ?? '';
  bool hasPlanImageUrl2() => _planImageUrl2 != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _code = snapshotData['code'] as String?;
    _name = snapshotData['name'] as String?;
    _planImageUrl = snapshotData['planImageUrl'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _enabled = snapshotData['enabled'] as bool?;
    _planImageUrl2 = snapshotData['planImageUrl2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('MaintenancePlans');

  static Stream<MaintenancePlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MaintenancePlansRecord.fromSnapshot(s));

  static Future<MaintenancePlansRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MaintenancePlansRecord.fromSnapshot(s));

  static MaintenancePlansRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MaintenancePlansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MaintenancePlansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MaintenancePlansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MaintenancePlansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MaintenancePlansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMaintenancePlansRecordData({
  String? id,
  String? code,
  String? name,
  String? planImageUrl,
  int? order,
  bool? enabled,
  String? planImageUrl2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'code': code,
      'name': name,
      'planImageUrl': planImageUrl,
      'order': order,
      'enabled': enabled,
      'planImageUrl2': planImageUrl2,
    }.withoutNulls,
  );

  return firestoreData;
}

class MaintenancePlansRecordDocumentEquality
    implements Equality<MaintenancePlansRecord> {
  const MaintenancePlansRecordDocumentEquality();

  @override
  bool equals(MaintenancePlansRecord? e1, MaintenancePlansRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.code == e2?.code &&
        e1?.name == e2?.name &&
        e1?.planImageUrl == e2?.planImageUrl &&
        e1?.order == e2?.order &&
        e1?.enabled == e2?.enabled &&
        e1?.planImageUrl2 == e2?.planImageUrl2;
  }

  @override
  int hash(MaintenancePlansRecord? e) => const ListEquality().hash([
        e?.id,
        e?.code,
        e?.name,
        e?.planImageUrl,
        e?.order,
        e?.enabled,
        e?.planImageUrl2
      ]);

  @override
  bool isValidKey(Object? o) => o is MaintenancePlansRecord;
}
