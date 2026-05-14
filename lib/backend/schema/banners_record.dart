import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BannersRecord extends FirestoreRecord {
  BannersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bannerUrl" field.
  String? _bannerUrl;
  String get bannerUrl => _bannerUrl ?? '';
  bool hasBannerUrl() => _bannerUrl != null;

  // "section" field.
  String? _section;
  String get section => _section ?? '';
  bool hasSection() => _section != null;

  // "enable" field.
  bool? _enable;
  bool get enable => _enable ?? false;
  bool hasEnable() => _enable != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "bannerUrlMobile" field.
  String? _bannerUrlMobile;
  String get bannerUrlMobile => _bannerUrlMobile ?? '';
  bool hasBannerUrlMobile() => _bannerUrlMobile != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "videoMobileUrl" field.
  String? _videoMobileUrl;
  String get videoMobileUrl => _videoMobileUrl ?? '';
  bool hasVideoMobileUrl() => _videoMobileUrl != null;

  void _initializeFields() {
    _bannerUrl = snapshotData['bannerUrl'] as String?;
    _section = snapshotData['section'] as String?;
    _enable = snapshotData['enable'] as bool?;
    _order = castToType<int>(snapshotData['order']);
    _bannerUrlMobile = snapshotData['bannerUrlMobile'] as String?;
    _type = snapshotData['type'] as String?;
    _videoUrl = snapshotData['videoUrl'] as String?;
    _videoMobileUrl = snapshotData['videoMobileUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Banners');

  static Stream<BannersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BannersRecord.fromSnapshot(s));

  static Future<BannersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BannersRecord.fromSnapshot(s));

  static BannersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BannersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BannersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BannersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BannersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BannersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBannersRecordData({
  String? bannerUrl,
  String? section,
  bool? enable,
  int? order,
  String? bannerUrlMobile,
  String? type,
  String? videoUrl,
  String? videoMobileUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bannerUrl': bannerUrl,
      'section': section,
      'enable': enable,
      'order': order,
      'bannerUrlMobile': bannerUrlMobile,
      'type': type,
      'videoUrl': videoUrl,
      'videoMobileUrl': videoMobileUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class BannersRecordDocumentEquality implements Equality<BannersRecord> {
  const BannersRecordDocumentEquality();

  @override
  bool equals(BannersRecord? e1, BannersRecord? e2) {
    return e1?.bannerUrl == e2?.bannerUrl &&
        e1?.section == e2?.section &&
        e1?.enable == e2?.enable &&
        e1?.order == e2?.order &&
        e1?.bannerUrlMobile == e2?.bannerUrlMobile &&
        e1?.type == e2?.type &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.videoMobileUrl == e2?.videoMobileUrl;
  }

  @override
  int hash(BannersRecord? e) => const ListEquality().hash([
        e?.bannerUrl,
        e?.section,
        e?.enable,
        e?.order,
        e?.bannerUrlMobile,
        e?.type,
        e?.videoUrl,
        e?.videoMobileUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is BannersRecord;
}
