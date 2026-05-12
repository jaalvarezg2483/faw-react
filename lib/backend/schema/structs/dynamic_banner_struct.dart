// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DynamicBannerStruct extends FFFirebaseStruct {
  DynamicBannerStruct({
    String? id,
    String? type,
    String? section,
    bool? enable,
    String? imageUrl,
    String? imageUrlMobile,
    String? videoUrl,
    int? order,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _type = type,
        _section = section,
        _enable = enable,
        _imageUrl = imageUrl,
        _imageUrlMobile = imageUrlMobile,
        _videoUrl = videoUrl,
        _order = order,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? 'banner001';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "type" field.
  String? _type;
  String get type => _type ?? 'IMAGE';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "section" field.
  String? _section;
  String get section => _section ?? 'Home';
  set section(String? val) => _section = val;

  bool hasSection() => _section != null;

  // "enable" field.
  bool? _enable;
  bool get enable => _enable ?? true;
  set enable(bool? val) => _enable = val;

  bool hasEnable() => _enable != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  // "imageUrlMobile" field.
  String? _imageUrlMobile;
  String get imageUrlMobile => _imageUrlMobile ?? '';
  set imageUrlMobile(String? val) => _imageUrlMobile = val;

  bool hasImageUrlMobile() => _imageUrlMobile != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  set videoUrl(String? val) => _videoUrl = val;

  bool hasVideoUrl() => _videoUrl != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 1;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  static DynamicBannerStruct fromMap(Map<String, dynamic> data) =>
      DynamicBannerStruct(
        id: data['id'] as String?,
        type: data['type'] as String?,
        section: data['section'] as String?,
        enable: data['enable'] as bool?,
        imageUrl: data['imageUrl'] as String?,
        imageUrlMobile: data['imageUrlMobile'] as String?,
        videoUrl: data['videoUrl'] as String?,
        order: castToType<int>(data['order']),
      );

  static DynamicBannerStruct? maybeFromMap(dynamic data) => data is Map
      ? DynamicBannerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'type': _type,
        'section': _section,
        'enable': _enable,
        'imageUrl': _imageUrl,
        'imageUrlMobile': _imageUrlMobile,
        'videoUrl': _videoUrl,
        'order': _order,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'section': serializeParam(
          _section,
          ParamType.String,
        ),
        'enable': serializeParam(
          _enable,
          ParamType.bool,
        ),
        'imageUrl': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
        'imageUrlMobile': serializeParam(
          _imageUrlMobile,
          ParamType.String,
        ),
        'videoUrl': serializeParam(
          _videoUrl,
          ParamType.String,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
      }.withoutNulls;

  static DynamicBannerStruct fromSerializableMap(Map<String, dynamic> data) =>
      DynamicBannerStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        section: deserializeParam(
          data['section'],
          ParamType.String,
          false,
        ),
        enable: deserializeParam(
          data['enable'],
          ParamType.bool,
          false,
        ),
        imageUrl: deserializeParam(
          data['imageUrl'],
          ParamType.String,
          false,
        ),
        imageUrlMobile: deserializeParam(
          data['imageUrlMobile'],
          ParamType.String,
          false,
        ),
        videoUrl: deserializeParam(
          data['videoUrl'],
          ParamType.String,
          false,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DynamicBannerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DynamicBannerStruct &&
        id == other.id &&
        type == other.type &&
        section == other.section &&
        enable == other.enable &&
        imageUrl == other.imageUrl &&
        imageUrlMobile == other.imageUrlMobile &&
        videoUrl == other.videoUrl &&
        order == other.order;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [id, type, section, enable, imageUrl, imageUrlMobile, videoUrl, order]);
}

DynamicBannerStruct createDynamicBannerStruct({
  String? id,
  String? type,
  String? section,
  bool? enable,
  String? imageUrl,
  String? imageUrlMobile,
  String? videoUrl,
  int? order,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DynamicBannerStruct(
      id: id,
      type: type,
      section: section,
      enable: enable,
      imageUrl: imageUrl,
      imageUrlMobile: imageUrlMobile,
      videoUrl: videoUrl,
      order: order,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DynamicBannerStruct? updateDynamicBannerStruct(
  DynamicBannerStruct? dynamicBanner, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dynamicBanner
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDynamicBannerStructData(
  Map<String, dynamic> firestoreData,
  DynamicBannerStruct? dynamicBanner,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dynamicBanner == null) {
    return;
  }
  if (dynamicBanner.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dynamicBanner.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dynamicBannerData =
      getDynamicBannerFirestoreData(dynamicBanner, forFieldValue);
  final nestedData =
      dynamicBannerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dynamicBanner.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDynamicBannerFirestoreData(
  DynamicBannerStruct? dynamicBanner, [
  bool forFieldValue = false,
]) {
  if (dynamicBanner == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dynamicBanner.toMap());

  // Add any Firestore field values
  mapToFirestore(dynamicBanner.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDynamicBannerListFirestoreData(
  List<DynamicBannerStruct>? dynamicBanners,
) =>
    dynamicBanners
        ?.map((e) => getDynamicBannerFirestoreData(e, true))
        .toList() ??
    [];
