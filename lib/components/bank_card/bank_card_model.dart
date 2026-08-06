import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'bank_card_widget.dart' show BankCardWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BankCardModel extends FlutterFlowModel<BankCardWidget> {
  ///  Local state fields for this component.

  double? minimumDownPayment;

  double? cuotaBancaria;

  double? cuotaMensual;

  double? currentDownPayment;

  bool showErrorWhenTooSmall = false;

  bool showErrorWhenTooBig = false;

  bool showLoading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (getPrima)] action in bankCard widget.
  ApiCallResponse? initialGetPrima;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (getPrima)] action in TextField widget.
  ApiCallResponse? getPrimaResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
