import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/footer/footer_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/nav_bar_mob/nav_bar_mob_widget.dart';
import '/components/redes/redes_widget.dart';
import '/components/selected_model/selected_model_widget.dart';
import '/components/vehicle_card/vehicle_card_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool isIdNotSelected = false;

  bool isTermsNotSelect = false;

  bool selected = false;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for NavBarMob component.
  late NavBarMobModel navBarMobModel;
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
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidation;
  // Stores action output result for [Backend Call - API (SendEmailQuotation)] action in Button widget.
  ApiCallResponse? apiResultFormHome;
  // Model for Redes component.
  late RedesModel redesModel;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    navBarMobModel = createModel(context, () => NavBarMobModel());
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
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
    navBarMobModel.dispose();
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
    footerModel.dispose();
  }
}
