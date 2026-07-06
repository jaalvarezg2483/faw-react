import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start BackendAPI Group Code

class BackendAPIGroup {
  static String getBaseUrl() =>
      'https://grupopurdy-websites-backend.azurewebsites.net';
  static Map<String, String> headers = {
    'Authorization': '5a90e16787a5b2c496f28f08c17321d3',
  };
  static SendContactFormCall sendContactFormCall = SendContactFormCall();
  static SendEmailContactCall sendEmailContactCall = SendEmailContactCall();
}

class SendContactFormCall {
  Future<ApiCallResponse> call({
    String? identification = '',
    String? name = '',
    String? surname = '',
    String? email = '',
    String? phone = '',
    String? comment = '',
    dynamic? modelsJson,
  }) async {
    final baseUrl = BackendAPIGroup.getBaseUrl();

    final models = _serializeJson(modelsJson, true);
    final ffApiRequestBody = '''
{
  "brand": "faw",
  "serviceType": 1,
  "identification": "${identification}",
  "name": "${name}",
  "surname": "${surname}",
  "email": "${email}",
  "phonenumber": "${phone}",
  "comment": "${comment}",
  "wantToGetFollowUp": true,
  "allowToUseInformation": true,
  "groupLogo": "https://purdyconnectiot.blob.core.windows.net/purdy-web-sites/GP_128X37.jpg",
  "adicionalInfo": ${models}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendContactForm',
      apiUrl: '${baseUrl}/api/Notifications/SendContactForm',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '5a90e16787a5b2c496f28f08c17321d3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendEmailContactCall {
  Future<ApiCallResponse> call({
    String? identification = '',
    String? name = '',
    String? surname = '',
    String? email = '',
    String? phone = '',
    String? comment = '',
    dynamic? modelsJson,
  }) async {
    final baseUrl = BackendAPIGroup.getBaseUrl();

    final models = _serializeJson(modelsJson, true);
    final ffApiRequestBody = '''
{
  "docType": 1,
  "identification": "${identification}",
  "name": "${name}",
  "surname": "${surname}",
  "email": "${email}",
  "phonenumber": "${phone}",
  "comment": "${comment}",
  "wantToGetFollowUp": true,
  "allowToUseInformation": true,
  "models": ${models}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SendEmailContact',
      apiUrl: '${baseUrl}/api/faw/Notifications/SendEmailQuotation',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '5a90e16787a5b2c496f28f08c17321d3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BackendAPI Group Code

/// Start BackendWithVariableURLByEnv Group Code

class BackendWithVariableURLByEnvGroup {
  static String getBaseUrl({
    String? urlBackendProd,
    String? urlBackendDev,
  }) {
    urlBackendProd ??= FFDevEnvironmentValues().URLBackendProd;
    urlBackendDev ??= FFDevEnvironmentValues().URLBackendDev;
    return '${urlBackendProd}';
  }

  static Map<String, String> headers = {
    'authorization': '5a90e16787a5b2c496f28f08c17321d3',
  };
  static GetBanksDataCall getBanksDataCall = GetBanksDataCall();
  static GetPrimaCall getPrimaCall = GetPrimaCall();
  static ValidateRecaptchaCall validateRecaptchaCall = ValidateRecaptchaCall();
  static SendEmailQuotationCall sendEmailQuotationCall =
      SendEmailQuotationCall();
}

class GetBanksDataCall {
  Future<ApiCallResponse> call({
    String? urlBackendProd,
    String? urlBackendDev,
  }) async {
    urlBackendProd ??= FFDevEnvironmentValues().URLBackendProd;
    urlBackendDev ??= FFDevEnvironmentValues().URLBackendDev;
    final baseUrl = BackendWithVariableURLByEnvGroup.getBaseUrl(
      urlBackendProd: urlBackendProd,
      urlBackendDev: urlBackendDev,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getBanksData',
      apiUrl: '${baseUrl}/Banks/financing-options?website=FAW',
      callType: ApiCallType.GET,
      headers: {
        'authorization': '5a90e16787a5b2c496f28f08c17321d3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetPrimaCall {
  Future<ApiCallResponse> call({
    String? id = '',
    double? prima,
    double? precioVehiculo,
    double? purdySeguro = 0,
    String? urlBackendProd,
    String? urlBackendDev,
  }) async {
    urlBackendProd ??= FFDevEnvironmentValues().URLBackendProd;
    urlBackendDev ??= FFDevEnvironmentValues().URLBackendDev;
    final baseUrl = BackendWithVariableURLByEnvGroup.getBaseUrl(
      urlBackendProd: urlBackendProd,
      urlBackendDev: urlBackendDev,
    );

    final ffApiRequestBody = '''
{
  "id": "${escapeStringForJson(id)}",
  "prima": ${prima},
  "precioVehiculo": ${precioVehiculo},
  "purdySeguro": ${purdySeguro}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getPrima',
      apiUrl: '${baseUrl}/Banks/calculate-financing',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '5a90e16787a5b2c496f28f08c17321d3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic cuotaBancaria(dynamic response) => getJsonField(
        response,
        r'''$.data.cuotaBancaria''',
      );
  dynamic cuotaMensual(dynamic response) => getJsonField(
        response,
        r'''$.data.cuotaMensual''',
      );
}

class ValidateRecaptchaCall {
  Future<ApiCallResponse> call({
    String? recaptchaToken = '',
    String? urlBackendProd,
    String? urlBackendDev,
  }) async {
    urlBackendProd ??= FFDevEnvironmentValues().URLBackendProd;
    urlBackendDev ??= FFDevEnvironmentValues().URLBackendDev;
    final baseUrl = BackendWithVariableURLByEnvGroup.getBaseUrl(
      urlBackendProd: urlBackendProd,
      urlBackendDev: urlBackendDev,
    );

    final ffApiRequestBody = '''
{
  "token": "${escapeStringForJson(recaptchaToken)}",
  "marca": "Faw"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Validate Recaptcha',
      apiUrl: '${baseUrl}/Security/ValidateReCaptcha',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '5a90e16787a5b2c496f28f08c17321d3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic cuotaBancaria(dynamic response) => getJsonField(
        response,
        r'''$.data.cuotaBancaria''',
      );
  dynamic cuotaMensual(dynamic response) => getJsonField(
        response,
        r'''$.data.cuotaMensual''',
      );
}

class SendEmailQuotationCall {
  Future<ApiCallResponse> call({
    String? identification = '',
    String? name = '',
    String? surname = '',
    String? email = '',
    String? phonenumber = '',
    String? comment = '',
    bool? wantToGetFollowUp = true,
    bool? allowToUseInformation = true,
    String? purdySeguro = '0',
    String? modelName = '',
    String? modelFilename = '',
    String? modelPrice = '',
    dynamic? banksJson,
    String? urlBackendProd,
    String? urlBackendDev,
  }) async {
    urlBackendProd ??= FFDevEnvironmentValues().URLBackendProd;
    urlBackendDev ??= FFDevEnvironmentValues().URLBackendDev;
    final baseUrl = BackendWithVariableURLByEnvGroup.getBaseUrl(
      urlBackendProd: urlBackendProd,
      urlBackendDev: urlBackendDev,
    );

    final banks = _serializeJson(banksJson);
    final ffApiRequestBody = '''
{
"docType": 1,
  "identification": "${escapeStringForJson(identification)}",
  "name": "${escapeStringForJson(name)}",
  "surname": "${escapeStringForJson(surname)}",
  "email": "${escapeStringForJson(email)}",
  "phonenumber": "${escapeStringForJson(phonenumber)}",
  "comment": "${escapeStringForJson(comment)}",
  "wantToGetFollowUp": true,
  "allowToUseInformation": true,
  "models": [
    {
      "name": "${escapeStringForJson(modelName)}",
      "filename": "${escapeStringForJson(modelFilename)}",
      "price": ${escapeStringForJson(modelPrice)}
    }
  ],
  "purdySeguro": 0,
"bancos": ${banks}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendEmailQuotation',
      apiUrl: '${baseUrl}/faw/Notifications/SendEmailFinancingQuotation',
      callType: ApiCallType.POST,
      headers: {
        'authorization': '5a90e16787a5b2c496f28f08c17321d3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End BackendWithVariableURLByEnv Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
