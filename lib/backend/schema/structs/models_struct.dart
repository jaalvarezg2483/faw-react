// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ModelsStruct extends FFFirebaseStruct {
  ModelsStruct({
    String? name,
    String? url,
    double? price,
    String? code,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _url = url,
        _price = price,
        _code = code,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  static ModelsStruct fromMap(Map<String, dynamic> data) => ModelsStruct(
        name: data['name'] as String?,
        url: data['url'] as String?,
        price: castToType<double>(data['price']),
        code: data['code'] as String?,
      );

  static ModelsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ModelsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'url': _url,
        'price': _price,
        'code': _code,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'code': serializeParam(
          _code,
          ParamType.String,
        ),
      }.withoutNulls;

  static ModelsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ModelsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ModelsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ModelsStruct &&
        name == other.name &&
        url == other.url &&
        price == other.price &&
        code == other.code;
  }

  @override
  int get hashCode => const ListEquality().hash([name, url, price, code]);
}

ModelsStruct createModelsStruct({
  String? name,
  String? url,
  double? price,
  String? code,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ModelsStruct(
      name: name,
      url: url,
      price: price,
      code: code,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ModelsStruct? updateModelsStruct(
  ModelsStruct? models, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    models
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addModelsStructData(
  Map<String, dynamic> firestoreData,
  ModelsStruct? models,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (models == null) {
    return;
  }
  if (models.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && models.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final modelsData = getModelsFirestoreData(models, forFieldValue);
  final nestedData = modelsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = models.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getModelsFirestoreData(
  ModelsStruct? models, [
  bool forFieldValue = false,
]) {
  if (models == null) {
    return {};
  }
  final firestoreData = mapToFirestore(models.toMap());

  // Add any Firestore field values
  models.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getModelsListFirestoreData(
  List<ModelsStruct>? modelss,
) =>
    modelss?.map((e) => getModelsFirestoreData(e, true)).toList() ?? [];
