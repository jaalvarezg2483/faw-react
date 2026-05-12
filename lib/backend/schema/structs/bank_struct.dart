// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BankStruct extends FFFirebaseStruct {
  BankStruct({
    String? id,
    String? name,
    double? tasa,
    int? plazos,
    double? comision,
    double? prima,
    int? order,
    int? fixedRateMonths,
    String? imageUrl,
    String? disclaimer,
    double? basePrima,
    double? currentPrima,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        _tasa = tasa,
        _plazos = plazos,
        _comision = comision,
        _prima = prima,
        _order = order,
        _fixedRateMonths = fixedRateMonths,
        _imageUrl = imageUrl,
        _disclaimer = disclaimer,
        _basePrima = basePrima,
        _currentPrima = currentPrima,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "tasa" field.
  double? _tasa;
  double get tasa => _tasa ?? 0.0;
  set tasa(double? val) => _tasa = val;

  void incrementTasa(double amount) => tasa = tasa + amount;

  bool hasTasa() => _tasa != null;

  // "plazos" field.
  int? _plazos;
  int get plazos => _plazos ?? 0;
  set plazos(int? val) => _plazos = val;

  void incrementPlazos(int amount) => plazos = plazos + amount;

  bool hasPlazos() => _plazos != null;

  // "comision" field.
  double? _comision;
  double get comision => _comision ?? 0.0;
  set comision(double? val) => _comision = val;

  void incrementComision(double amount) => comision = comision + amount;

  bool hasComision() => _comision != null;

  // "prima" field.
  double? _prima;
  double get prima => _prima ?? 0.0;
  set prima(double? val) => _prima = val;

  void incrementPrima(double amount) => prima = prima + amount;

  bool hasPrima() => _prima != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  // "fixedRateMonths" field.
  int? _fixedRateMonths;
  int get fixedRateMonths => _fixedRateMonths ?? 0;
  set fixedRateMonths(int? val) => _fixedRateMonths = val;

  void incrementFixedRateMonths(int amount) =>
      fixedRateMonths = fixedRateMonths + amount;

  bool hasFixedRateMonths() => _fixedRateMonths != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  set imageUrl(String? val) => _imageUrl = val;

  bool hasImageUrl() => _imageUrl != null;

  // "disclaimer" field.
  String? _disclaimer;
  String get disclaimer => _disclaimer ?? '';
  set disclaimer(String? val) => _disclaimer = val;

  bool hasDisclaimer() => _disclaimer != null;

  // "basePrima" field.
  double? _basePrima;
  double get basePrima => _basePrima ?? 0.0;
  set basePrima(double? val) => _basePrima = val;

  void incrementBasePrima(double amount) => basePrima = basePrima + amount;

  bool hasBasePrima() => _basePrima != null;

  // "currentPrima" field.
  double? _currentPrima;
  double get currentPrima => _currentPrima ?? 0.0;
  set currentPrima(double? val) => _currentPrima = val;

  void incrementCurrentPrima(double amount) =>
      currentPrima = currentPrima + amount;

  bool hasCurrentPrima() => _currentPrima != null;

  static BankStruct fromMap(Map<String, dynamic> data) => BankStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
        tasa: castToType<double>(data['tasa']),
        plazos: castToType<int>(data['plazos']),
        comision: castToType<double>(data['comision']),
        prima: castToType<double>(data['prima']),
        order: castToType<int>(data['order']),
        fixedRateMonths: castToType<int>(data['fixedRateMonths']),
        imageUrl: data['imageUrl'] as String?,
        disclaimer: data['disclaimer'] as String?,
        basePrima: castToType<double>(data['basePrima']),
        currentPrima: castToType<double>(data['currentPrima']),
      );

  static BankStruct? maybeFromMap(dynamic data) =>
      data is Map ? BankStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
        'tasa': _tasa,
        'plazos': _plazos,
        'comision': _comision,
        'prima': _prima,
        'order': _order,
        'fixedRateMonths': _fixedRateMonths,
        'imageUrl': _imageUrl,
        'disclaimer': _disclaimer,
        'basePrima': _basePrima,
        'currentPrima': _currentPrima,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'tasa': serializeParam(
          _tasa,
          ParamType.double,
        ),
        'plazos': serializeParam(
          _plazos,
          ParamType.int,
        ),
        'comision': serializeParam(
          _comision,
          ParamType.double,
        ),
        'prima': serializeParam(
          _prima,
          ParamType.double,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
        'fixedRateMonths': serializeParam(
          _fixedRateMonths,
          ParamType.int,
        ),
        'imageUrl': serializeParam(
          _imageUrl,
          ParamType.String,
        ),
        'disclaimer': serializeParam(
          _disclaimer,
          ParamType.String,
        ),
        'basePrima': serializeParam(
          _basePrima,
          ParamType.double,
        ),
        'currentPrima': serializeParam(
          _currentPrima,
          ParamType.double,
        ),
      }.withoutNulls;

  static BankStruct fromSerializableMap(Map<String, dynamic> data) =>
      BankStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        tasa: deserializeParam(
          data['tasa'],
          ParamType.double,
          false,
        ),
        plazos: deserializeParam(
          data['plazos'],
          ParamType.int,
          false,
        ),
        comision: deserializeParam(
          data['comision'],
          ParamType.double,
          false,
        ),
        prima: deserializeParam(
          data['prima'],
          ParamType.double,
          false,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
        fixedRateMonths: deserializeParam(
          data['fixedRateMonths'],
          ParamType.int,
          false,
        ),
        imageUrl: deserializeParam(
          data['imageUrl'],
          ParamType.String,
          false,
        ),
        disclaimer: deserializeParam(
          data['disclaimer'],
          ParamType.String,
          false,
        ),
        basePrima: deserializeParam(
          data['basePrima'],
          ParamType.double,
          false,
        ),
        currentPrima: deserializeParam(
          data['currentPrima'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BankStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BankStruct &&
        id == other.id &&
        name == other.name &&
        tasa == other.tasa &&
        plazos == other.plazos &&
        comision == other.comision &&
        prima == other.prima &&
        order == other.order &&
        fixedRateMonths == other.fixedRateMonths &&
        imageUrl == other.imageUrl &&
        disclaimer == other.disclaimer &&
        basePrima == other.basePrima &&
        currentPrima == other.currentPrima;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        name,
        tasa,
        plazos,
        comision,
        prima,
        order,
        fixedRateMonths,
        imageUrl,
        disclaimer,
        basePrima,
        currentPrima
      ]);
}

BankStruct createBankStruct({
  String? id,
  String? name,
  double? tasa,
  int? plazos,
  double? comision,
  double? prima,
  int? order,
  int? fixedRateMonths,
  String? imageUrl,
  String? disclaimer,
  double? basePrima,
  double? currentPrima,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BankStruct(
      id: id,
      name: name,
      tasa: tasa,
      plazos: plazos,
      comision: comision,
      prima: prima,
      order: order,
      fixedRateMonths: fixedRateMonths,
      imageUrl: imageUrl,
      disclaimer: disclaimer,
      basePrima: basePrima,
      currentPrima: currentPrima,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BankStruct? updateBankStruct(
  BankStruct? bank, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bank
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBankStructData(
  Map<String, dynamic> firestoreData,
  BankStruct? bank,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bank == null) {
    return;
  }
  if (bank.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && bank.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bankData = getBankFirestoreData(bank, forFieldValue);
  final nestedData = bankData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bank.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBankFirestoreData(
  BankStruct? bank, [
  bool forFieldValue = false,
]) {
  if (bank == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bank.toMap());

  // Add any Firestore field values
  mapToFirestore(bank.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBankListFirestoreData(
  List<BankStruct>? banks,
) =>
    banks?.map((e) => getBankFirestoreData(e, true)).toList() ?? [];
