import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/footer/footer_widget.dart';
import '/components/location_card/location_card_widget.dart';
import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/components/nav_barv2/nav_barv2_widget.dart';
import '/components/redes/redes_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'contact_us_widget.dart' show ContactUsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ContactUsModel extends FlutterFlowModel<ContactUsWidget> {
  ///  Local state fields for this page.

  String buttomActive = 'contacto';

  bool selected = false;

  bool isIdNotSelected = false;

  bool isTermsNotSelect = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NavBarv2 component.
  late NavBarv2Model navBarv2Model;
  // Model for NavBarMobv2 component.
  late NavBarMobv2Model navBarMobv2Model;
  // Model for Footer component.
  late FooterModel footerModel;
  // State field(s) for ddType widget.
  String? ddTypeValue;
  FormFieldController<String>? ddTypeValueController;
  // State field(s) for tf widget.
  FocusNode? tfFocusNode;
  TextEditingController? tfTextController;
  String? Function(BuildContext, String?)? tfTextControllerValidator;
  String? _tfTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido ';
    }

    return null;
  }

  // State field(s) for tfCedJuridica widget.
  FocusNode? tfCedJuridicaFocusNode;
  TextEditingController? tfCedJuridicaTextController;
  String? Function(BuildContext, String?)? tfCedJuridicaTextControllerValidator;
  String? _tfCedJuridicaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido ';
    }

    return null;
  }

  // State field(s) for tfDIMEX widget.
  FocusNode? tfDIMEXFocusNode;
  TextEditingController? tfDIMEXTextController;
  String? Function(BuildContext, String?)? tfDIMEXTextControllerValidator;
  String? _tfDIMEXTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido ';
    }

    return null;
  }

  // State field(s) for tfPassport widget.
  FocusNode? tfPassportFocusNode;
  TextEditingController? tfPassportTextController;
  String? Function(BuildContext, String?)? tfPassportTextControllerValidator;
  String? _tfPassportTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido ';
    }

    return null;
  }

  // State field(s) for tfOtherId widget.
  FocusNode? tfOtherIdFocusNode;
  TextEditingController? tfOtherIdTextController;
  String? Function(BuildContext, String?)? tfOtherIdTextControllerValidator;
  String? _tfOtherIdTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido ';
    }

    return null;
  }

  // State field(s) for Nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  String? _nombreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido ';
    }

    return null;
  }

  // State field(s) for Apellido widget.
  FocusNode? apellidoFocusNode;
  TextEditingController? apellidoTextController;
  String? Function(BuildContext, String?)? apellidoTextControllerValidator;
  String? _apellidoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido ';
    }

    return null;
  }

  // State field(s) for correo widget.
  FocusNode? correoFocusNode;
  TextEditingController? correoTextController;
  String? Function(BuildContext, String?)? correoTextControllerValidator;
  String? _correoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido ';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Debes ingresar una dirección de correo válida';
    }
    return null;
  }

  // State field(s) for tel widget.
  FocusNode? telFocusNode;
  TextEditingController? telTextController;
  String? Function(BuildContext, String?)? telTextControllerValidator;
  String? _telTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido ';
    }

    return null;
  }

  // State field(s) for comen widget.
  FocusNode? comenFocusNode;
  TextEditingController? comenTextController;
  String? Function(BuildContext, String?)? comenTextControllerValidator;
  String? _comenTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo requerido ';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Validate Form] action in Container widget.
  bool? formValidation;
  // Stores action output result for [Backend Call - API (SendContactForm)] action in Container widget.
  ApiCallResponse? apiResultFormHome;
  // Model for Redes component.
  late RedesModel redesModel;

  @override
  void initState(BuildContext context) {
    navBarv2Model = createModel(context, () => NavBarv2Model());
    navBarMobv2Model = createModel(context, () => NavBarMobv2Model());
    footerModel = createModel(context, () => FooterModel());
    tfTextControllerValidator = _tfTextControllerValidator;
    tfCedJuridicaTextControllerValidator =
        _tfCedJuridicaTextControllerValidator;
    tfDIMEXTextControllerValidator = _tfDIMEXTextControllerValidator;
    tfPassportTextControllerValidator = _tfPassportTextControllerValidator;
    tfOtherIdTextControllerValidator = _tfOtherIdTextControllerValidator;
    nombreTextControllerValidator = _nombreTextControllerValidator;
    apellidoTextControllerValidator = _apellidoTextControllerValidator;
    correoTextControllerValidator = _correoTextControllerValidator;
    telTextControllerValidator = _telTextControllerValidator;
    comenTextControllerValidator = _comenTextControllerValidator;
    redesModel = createModel(context, () => RedesModel());
  }

  @override
  void dispose() {
    navBarv2Model.dispose();
    navBarMobv2Model.dispose();
    footerModel.dispose();
    tfFocusNode?.dispose();
    tfTextController?.dispose();

    tfCedJuridicaFocusNode?.dispose();
    tfCedJuridicaTextController?.dispose();

    tfDIMEXFocusNode?.dispose();
    tfDIMEXTextController?.dispose();

    tfPassportFocusNode?.dispose();
    tfPassportTextController?.dispose();

    tfOtherIdFocusNode?.dispose();
    tfOtherIdTextController?.dispose();

    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    apellidoFocusNode?.dispose();
    apellidoTextController?.dispose();

    correoFocusNode?.dispose();
    correoTextController?.dispose();

    telFocusNode?.dispose();
    telTextController?.dispose();

    comenFocusNode?.dispose();
    comenTextController?.dispose();

    redesModel.dispose();
  }
}
