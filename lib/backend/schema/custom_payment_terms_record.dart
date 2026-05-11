import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomPaymentTermsRecord extends FirestoreRecord {
  CustomPaymentTermsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "bank" field.
  String? _bank;
  String get bank => _bank ?? '';
  bool hasBank() => _bank != null;

  // "hasBankActive" field.
  bool? _hasBankActive;
  bool get hasBankActive => _hasBankActive ?? false;
  bool hasHasBankActive() => _hasBankActive != null;

  void _initializeFields() {
    _code = snapshotData['code'] as String?;
    _bank = snapshotData['bank'] as String?;
    _hasBankActive = snapshotData['hasBankActive'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CustomPaymentTerms');

  static Stream<CustomPaymentTermsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomPaymentTermsRecord.fromSnapshot(s));

  static Future<CustomPaymentTermsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CustomPaymentTermsRecord.fromSnapshot(s));

  static CustomPaymentTermsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomPaymentTermsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomPaymentTermsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomPaymentTermsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomPaymentTermsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomPaymentTermsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomPaymentTermsRecordData({
  String? code,
  String? bank,
  bool? hasBankActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'bank': bank,
      'hasBankActive': hasBankActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomPaymentTermsRecordDocumentEquality
    implements Equality<CustomPaymentTermsRecord> {
  const CustomPaymentTermsRecordDocumentEquality();

  @override
  bool equals(CustomPaymentTermsRecord? e1, CustomPaymentTermsRecord? e2) {
    return e1?.code == e2?.code &&
        e1?.bank == e2?.bank &&
        e1?.hasBankActive == e2?.hasBankActive;
  }

  @override
  int hash(CustomPaymentTermsRecord? e) =>
      const ListEquality().hash([e?.code, e?.bank, e?.hasBankActive]);

  @override
  bool isValidKey(Object? o) => o is CustomPaymentTermsRecord;
}
