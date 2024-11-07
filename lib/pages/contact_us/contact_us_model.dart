import '/components/footer/footer_widget.dart';
import '/components/location_card/location_card_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/nav_bar_mob/nav_bar_mob_widget.dart';
import '/components/redes/redes_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'contact_us_widget.dart' show ContactUsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class ContactUsModel extends FlutterFlowModel<ContactUsWidget> {
  ///  Local state fields for this page.

  String buttomActive = 'contacto';

  bool selected = false;

  bool isIdNotSelected = false;

  bool isTermsNotSelect = false;

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
      return 'Campo Requerido';
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
      return 'Campo Requerido';
    }

    return null;
  }

  // State field(s) for tfDIMEX widget.
  FocusNode? tfDIMEXFocusNode;
  TextEditingController? tfDIMEXTextController;
  String? Function(BuildContext, String?)? tfDIMEXTextControllerValidator;
  String? _tfDIMEXTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido';
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
      return 'Campo Requerido';
    }

    return null;
  }

  // State field(s) for tfOtherId widget.
  FocusNode? tfOtherIdFocusNode;
  TextEditingController? tfOtherIdTextController;
  String? Function(BuildContext, String?)? tfOtherIdTextControllerValidator;
  String? _tfOtherIdTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  String? _textController6Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  String? _textController7Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido';
    }

    return null;
  }

  // State field(s) for co widget.
  FocusNode? coFocusNode;
  TextEditingController? coTextController;
  String? Function(BuildContext, String?)? coTextControllerValidator;
  String? _coTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController9;
  String? Function(BuildContext, String?)? textController9Validator;
  String? _textController9Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Requerido';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController10;
  String? Function(BuildContext, String?)? textController10Validator;
  String? _textController10Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? forms;
  // Model for LocationCard component.
  late LocationCardModel locationCardModel1;
  // Model for LocationCard component.
  late LocationCardModel locationCardModel2;
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
    textController6Validator = _textController6Validator;
    textController7Validator = _textController7Validator;
    coTextControllerValidator = _coTextControllerValidator;
    textController9Validator = _textController9Validator;
    textController10Validator = _textController10Validator;
    locationCardModel1 = createModel(context, () => LocationCardModel());
    locationCardModel2 = createModel(context, () => LocationCardModel());
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

    textFieldFocusNode1?.dispose();
    textController6?.dispose();

    textFieldFocusNode2?.dispose();
    textController7?.dispose();

    coFocusNode?.dispose();
    coTextController?.dispose();

    textFieldFocusNode3?.dispose();
    textController9?.dispose();

    textFieldFocusNode4?.dispose();
    textController10?.dispose();

    locationCardModel1.dispose();
    locationCardModel2.dispose();
    redesModel.dispose();
    footerModel.dispose();
  }
}
