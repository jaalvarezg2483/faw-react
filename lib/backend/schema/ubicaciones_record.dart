import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UbicacionesRecord extends FirestoreRecord {
  UbicacionesRecord._(
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

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "branchHours" field.
  String? _branchHours;
  String get branchHours => _branchHours ?? '';
  bool hasBranchHours() => _branchHours != null;

  // "workshopHours" field.
  String? _workshopHours;
  String get workshopHours => _workshopHours ?? '';
  bool hasWorkshopHours() => _workshopHours != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "mapHtml" field.
  String? _mapHtml;
  String get mapHtml => _mapHtml ?? '';
  bool hasMapHtml() => _mapHtml != null;

  // "wazeLink" field.
  String? _wazeLink;
  String get wazeLink => _wazeLink ?? '';
  bool hasWazeLink() => _wazeLink != null;

  // "googleLink" field.
  String? _googleLink;
  String get googleLink => _googleLink ?? '';
  bool hasGoogleLink() => _googleLink != null;

  // "isBranchOffice" field.
  bool? _isBranchOffice;
  bool get isBranchOffice => _isBranchOffice ?? false;
  bool hasIsBranchOffice() => _isBranchOffice != null;

  // "isRepairShop" field.
  bool? _isRepairShop;
  bool get isRepairShop => _isRepairShop ?? false;
  bool hasIsRepairShop() => _isRepairShop != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "specialities" field.
  List<String>? _specialities;
  List<String> get specialities => _specialities ?? const [];
  bool hasSpecialities() => _specialities != null;

  void _initializeFields() {
    _order = castToType<int>(snapshotData['order']);
    _name = snapshotData['name'] as String?;
    _address = snapshotData['address'] as String?;
    _location = snapshotData['location'] as String?;
    _branchHours = snapshotData['branchHours'] as String?;
    _workshopHours = snapshotData['workshopHours'] as String?;
    _phone = snapshotData['phone'] as String?;
    _mapHtml = snapshotData['mapHtml'] as String?;
    _wazeLink = snapshotData['wazeLink'] as String?;
    _googleLink = snapshotData['googleLink'] as String?;
    _isBranchOffice = snapshotData['isBranchOffice'] as bool?;
    _isRepairShop = snapshotData['isRepairShop'] as bool?;
    _isActive = snapshotData['isActive'] as bool?;
    _specialities = getDataList(snapshotData['specialities']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Ubicaciones');

  static Stream<UbicacionesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UbicacionesRecord.fromSnapshot(s));

  static Future<UbicacionesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UbicacionesRecord.fromSnapshot(s));

  static UbicacionesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UbicacionesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UbicacionesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UbicacionesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UbicacionesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UbicacionesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUbicacionesRecordData({
  int? order,
  String? name,
  String? address,
  String? location,
  String? branchHours,
  String? workshopHours,
  String? phone,
  String? mapHtml,
  String? wazeLink,
  String? googleLink,
  bool? isBranchOffice,
  bool? isRepairShop,
  bool? isActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order': order,
      'name': name,
      'address': address,
      'location': location,
      'branchHours': branchHours,
      'workshopHours': workshopHours,
      'phone': phone,
      'mapHtml': mapHtml,
      'wazeLink': wazeLink,
      'googleLink': googleLink,
      'isBranchOffice': isBranchOffice,
      'isRepairShop': isRepairShop,
      'isActive': isActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class UbicacionesRecordDocumentEquality implements Equality<UbicacionesRecord> {
  const UbicacionesRecordDocumentEquality();

  @override
  bool equals(UbicacionesRecord? e1, UbicacionesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.order == e2?.order &&
        e1?.name == e2?.name &&
        e1?.address == e2?.address &&
        e1?.location == e2?.location &&
        e1?.branchHours == e2?.branchHours &&
        e1?.workshopHours == e2?.workshopHours &&
        e1?.phone == e2?.phone &&
        e1?.mapHtml == e2?.mapHtml &&
        e1?.wazeLink == e2?.wazeLink &&
        e1?.googleLink == e2?.googleLink &&
        e1?.isBranchOffice == e2?.isBranchOffice &&
        e1?.isRepairShop == e2?.isRepairShop &&
        e1?.isActive == e2?.isActive &&
        listEquality.equals(e1?.specialities, e2?.specialities);
  }

  @override
  int hash(UbicacionesRecord? e) => const ListEquality().hash([
        e?.order,
        e?.name,
        e?.address,
        e?.location,
        e?.branchHours,
        e?.workshopHours,
        e?.phone,
        e?.mapHtml,
        e?.wazeLink,
        e?.googleLink,
        e?.isBranchOffice,
        e?.isRepairShop,
        e?.isActive,
        e?.specialities
      ]);

  @override
  bool isValidKey(Object? o) => o is UbicacionesRecord;
}
