import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'cabezales_widget.dart' show CabezalesWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CabezalesModel extends FlutterFlowModel<CabezalesWidget> {
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
