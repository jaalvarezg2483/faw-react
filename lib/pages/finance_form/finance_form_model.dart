import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/footer/footer_widget.dart';
import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/components/nav_barv2/nav_barv2_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'finance_form_widget.dart' show FinanceFormWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class FinanceFormModel extends FlutterFlowModel<FinanceFormWidget> {
  ///  Local state fields for this page.

  bool isIdNotSelected = false;

  List<BankStruct> banks = [];
  void addToBanks(BankStruct item) => banks.add(item);
  void removeFromBanks(BankStruct item) => banks.remove(item);
  void removeAtIndexFromBanks(int index) => banks.removeAt(index);
  void insertAtIndexInBanks(int index, BankStruct item) =>
      banks.insert(index, item);
  void updateBanksAtIndex(int index, Function(BankStruct) updateFn) =>
      banks[index] = updateFn(banks[index]);

  List<CustomPaymentTermsRecord> excludedBanks = [];
  void addToExcludedBanks(CustomPaymentTermsRecord item) =>
      excludedBanks.add(item);
  void removeFromExcludedBanks(CustomPaymentTermsRecord item) =>
      excludedBanks.remove(item);
  void removeAtIndexFromExcludedBanks(int index) =>
      excludedBanks.removeAt(index);
  void insertAtIndexInExcludedBanks(int index, CustomPaymentTermsRecord item) =>
      excludedBanks.insert(index, item);
  void updateExcludedBanksAtIndex(
          int index, Function(CustomPaymentTermsRecord) updateFn) =>
      excludedBanks[index] = updateFn(excludedBanks[index]);

  List<BankStruct> filteredBankList = [];
  void addToFilteredBankList(BankStruct item) => filteredBankList.add(item);
  void removeFromFilteredBankList(BankStruct item) =>
      filteredBankList.remove(item);
  void removeAtIndexFromFilteredBankList(int index) =>
      filteredBankList.removeAt(index);
  void insertAtIndexInFilteredBankList(int index, BankStruct item) =>
      filteredBankList.insert(index, item);
  void updateFilteredBankListAtIndex(
          int index, Function(BankStruct) updateFn) =>
      filteredBankList[index] = updateFn(filteredBankList[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (getBanksData)] action in FinanceForm widget.
  ApiCallResponse? getBanksResult;
  // Stores action output result for [Firestore Query - Query a collection] action in FinanceForm widget.
  List<CustomPaymentTermsRecord>? getExcludedBanks;
  // Stores action output result for [Firestore Query - Query a collection] action in FinanceForm widget.
  ModelsRecord? vehicleSelected;
  // Model for NavBarv2 component.
  late NavBarv2Model navBarv2Model;
  // Model for NavBarMobv2 component.
  late NavBarMobv2Model navBarMobv2Model;
  // State field(s) for IDDropDown widget.
  String? iDDropDownValue;
  FormFieldController<String>? iDDropDownValueController;
  // State field(s) for IDFisicaTxt widget.
  FocusNode? iDFisicaTxtFocusNode;
  TextEditingController? iDFisicaTxtTextController;
  String? Function(BuildContext, String?)? iDFisicaTxtTextControllerValidator;
  String? _iDFisicaTxtTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    if (val.length < 9) {
      return 'Ingrese 9 dígitos';
    }

    if (!RegExp('^\\d{9}\$').hasMatch(val)) {
      return 'Ingresa un formato válido  para el tipo de identificación seleccionado';
    }
    return null;
  }

  // State field(s) for IDJuridicaTxt widget.
  FocusNode? iDJuridicaTxtFocusNode;
  TextEditingController? iDJuridicaTxtTextController;
  String? Function(BuildContext, String?)? iDJuridicaTxtTextControllerValidator;
  String? _iDJuridicaTxtTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    if (val.length < 10) {
      return 'Ingrese 10 dígitos';
    }

    if (!RegExp('^\\d{10}\$').hasMatch(val)) {
      return 'Ingresa un formato válido  para el tipo de identificación seleccionado';
    }
    return null;
  }

  // State field(s) for IDDimexTxt widget.
  FocusNode? iDDimexTxtFocusNode;
  TextEditingController? iDDimexTxtTextController;
  String? Function(BuildContext, String?)? iDDimexTxtTextControllerValidator;
  String? _iDDimexTxtTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    if (val.length < 11) {
      return 'Ingrese al menos 11 dígitos';
    }
    if (val.length > 12) {
      return 'Máximo de dígitos permitidos: 12';
    }
    if (!RegExp('^\\d{11,12}\$').hasMatch(val)) {
      return 'Ingresa un formato válido  para el tipo de identificación seleccionado';
    }
    return null;
  }

  // State field(s) for IDPasaporteTxt widget.
  FocusNode? iDPasaporteTxtFocusNode;
  TextEditingController? iDPasaporteTxtTextController;
  String? Function(BuildContext, String?)?
      iDPasaporteTxtTextControllerValidator;
  String? _iDPasaporteTxtTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    if (val.length < 6) {
      return 'Ingrese al menos 6 caracteres';
    }
    if (val.length > 9) {
      return 'Máximo de caracteres permitidos: 9';
    }
    if (!RegExp('^[A-Z0-9]{6,9}\$').hasMatch(val)) {
      return 'Ingresa un formato válido  para el tipo de identificación seleccionado';
    }
    return null;
  }

  // State field(s) for IDOtroTxt widget.
  FocusNode? iDOtroTxtFocusNode;
  TextEditingController? iDOtroTxtTextController;
  String? Function(BuildContext, String?)? iDOtroTxtTextControllerValidator;
  String? _iDOtroTxtTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    if (val.length < 6) {
      return 'Ingrese al menos 6 caracteres';
    }
    if (val.length > 15) {
      return 'Máximo de caracteres permitidos: 15';
    }
    if (!RegExp('^[A-Za-z0-9]{1,15}\$').hasMatch(val)) {
      return 'Ingresa un formato válido  para el tipo de identificación seleccionado';
    }
    return null;
  }

  // State field(s) for NombreTxt widget.
  FocusNode? nombreTxtFocusNode;
  TextEditingController? nombreTxtTextController;
  String? Function(BuildContext, String?)? nombreTxtTextControllerValidator;
  String? _nombreTxtTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    if (val.length < 2) {
      return 'Ingrese al menos 2 caracteres';
    }

    return null;
  }

  // State field(s) for ApellidoTxt widget.
  FocusNode? apellidoTxtFocusNode;
  TextEditingController? apellidoTxtTextController;
  String? Function(BuildContext, String?)? apellidoTxtTextControllerValidator;
  String? _apellidoTxtTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    if (val.length < 2) {
      return 'Ingrese al menos 2 caracteres';
    }

    return null;
  }

  // State field(s) for TelefonoTxt widget.
  FocusNode? telefonoTxtFocusNode;
  TextEditingController? telefonoTxtTextController;
  String? Function(BuildContext, String?)? telefonoTxtTextControllerValidator;
  String? _telefonoTxtTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    if (val.length < 8) {
      return 'Ingrese 8 dígitos';
    }

    return null;
  }

  // State field(s) for EmailTxt widget.
  FocusNode? emailTxtFocusNode;
  TextEditingController? emailTxtTextController;
  String? Function(BuildContext, String?)? emailTxtTextControllerValidator;
  String? _emailTxtTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    if (val.length < 10) {
      return 'Ingrese al menos 10 caracteres';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Debes ingresar una dirección de correo electrónico válida.';
    }
    return null;
  }

  // State field(s) for CommentTxt widget.
  FocusNode? commentTxtFocusNode;
  TextEditingController? commentTxtTextController;
  String? Function(BuildContext, String?)? commentTxtTextControllerValidator;
  String? _commentTxtTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido';
    }

    if (val.length < 5) {
      return 'Ingrese al menos 5 caracteres';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // Stores action output result for [Backend Call - API (sendEmailQuotation)] action in Button widget.
  ApiCallResponse? sendEmailResult;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    navBarv2Model = createModel(context, () => NavBarv2Model());
    navBarMobv2Model = createModel(context, () => NavBarMobv2Model());
    iDFisicaTxtTextControllerValidator = _iDFisicaTxtTextControllerValidator;
    iDJuridicaTxtTextControllerValidator =
        _iDJuridicaTxtTextControllerValidator;
    iDDimexTxtTextControllerValidator = _iDDimexTxtTextControllerValidator;
    iDPasaporteTxtTextControllerValidator =
        _iDPasaporteTxtTextControllerValidator;
    iDOtroTxtTextControllerValidator = _iDOtroTxtTextControllerValidator;
    nombreTxtTextControllerValidator = _nombreTxtTextControllerValidator;
    apellidoTxtTextControllerValidator = _apellidoTxtTextControllerValidator;
    telefonoTxtTextControllerValidator = _telefonoTxtTextControllerValidator;
    emailTxtTextControllerValidator = _emailTxtTextControllerValidator;
    commentTxtTextControllerValidator = _commentTxtTextControllerValidator;
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    navBarv2Model.dispose();
    navBarMobv2Model.dispose();
    iDFisicaTxtFocusNode?.dispose();
    iDFisicaTxtTextController?.dispose();

    iDJuridicaTxtFocusNode?.dispose();
    iDJuridicaTxtTextController?.dispose();

    iDDimexTxtFocusNode?.dispose();
    iDDimexTxtTextController?.dispose();

    iDPasaporteTxtFocusNode?.dispose();
    iDPasaporteTxtTextController?.dispose();

    iDOtroTxtFocusNode?.dispose();
    iDOtroTxtTextController?.dispose();

    nombreTxtFocusNode?.dispose();
    nombreTxtTextController?.dispose();

    apellidoTxtFocusNode?.dispose();
    apellidoTxtTextController?.dispose();

    telefonoTxtFocusNode?.dispose();
    telefonoTxtTextController?.dispose();

    emailTxtFocusNode?.dispose();
    emailTxtTextController?.dispose();

    commentTxtFocusNode?.dispose();
    commentTxtTextController?.dispose();

    footerModel.dispose();
  }
}
