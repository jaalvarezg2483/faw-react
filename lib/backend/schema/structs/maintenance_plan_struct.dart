// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MaintenancePlanStruct extends FFFirebaseStruct {
  MaintenancePlanStruct({
    String? id,
    String? code,
    String? name,
    String? planImage,
    int? order,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _code = code,
        _name = name,
        _planImage = planImage,
        _order = order,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "planImage" field.
  String? _planImage;
  String get planImage => _planImage ?? '';
  set planImage(String? val) => _planImage = val;

  bool hasPlanImage() => _planImage != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 1;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  static MaintenancePlanStruct fromMap(Map<String, dynamic> data) =>
      MaintenancePlanStruct(
        id: data['id'] as String?,
        code: data['code'] as String?,
        name: data['name'] as String?,
        planImage: data['planImage'] as String?,
        order: castToType<int>(data['order']),
      );

  static MaintenancePlanStruct? maybeFromMap(dynamic data) => data is Map
      ? MaintenancePlanStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'code': _code,
        'name': _name,
        'planImage': _planImage,
        'order': _order,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'planImage': serializeParam(
          _planImage,
          ParamType.String,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
      }.withoutNulls;

  static MaintenancePlanStruct fromSerializableMap(Map<String, dynamic> data) =>
      MaintenancePlanStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        planImage: deserializeParam(
          data['planImage'],
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
  String toString() => 'MaintenancePlanStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MaintenancePlanStruct &&
        id == other.id &&
        code == other.code &&
        name == other.name &&
        planImage == other.planImage &&
        order == other.order;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, code, name, planImage, order]);
}

MaintenancePlanStruct createMaintenancePlanStruct({
  String? id,
  String? code,
  String? name,
  String? planImage,
  int? order,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MaintenancePlanStruct(
      id: id,
      code: code,
      name: name,
      planImage: planImage,
      order: order,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MaintenancePlanStruct? updateMaintenancePlanStruct(
  MaintenancePlanStruct? maintenancePlan, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    maintenancePlan
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMaintenancePlanStructData(
  Map<String, dynamic> firestoreData,
  MaintenancePlanStruct? maintenancePlan,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (maintenancePlan == null) {
    return;
  }
  if (maintenancePlan.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && maintenancePlan.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final maintenancePlanData =
      getMaintenancePlanFirestoreData(maintenancePlan, forFieldValue);
  final nestedData =
      maintenancePlanData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = maintenancePlan.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMaintenancePlanFirestoreData(
  MaintenancePlanStruct? maintenancePlan, [
  bool forFieldValue = false,
]) {
  if (maintenancePlan == null) {
    return {};
  }
  final firestoreData = mapToFirestore(maintenancePlan.toMap());

  // Add any Firestore field values
  mapToFirestore(maintenancePlan.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMaintenancePlanListFirestoreData(
  List<MaintenancePlanStruct>? maintenancePlans,
) =>
    maintenancePlans
        ?.map((e) => getMaintenancePlanFirestoreData(e, true))
        .toList() ??
    [];
