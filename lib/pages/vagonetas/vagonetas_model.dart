import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'vagonetas_widget.dart' show VagonetasWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VagonetasModel extends FlutterFlowModel<VagonetasWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarMobv2 component.
  late NavBarMobv2Model navBarMobv2Model;

  @override
  void initState(BuildContext context) {
    navBarMobv2Model = createModel(context, () => NavBarMobv2Model());
  }

  @override
  void dispose() {
    navBarMobv2Model.dispose();
  }
}
