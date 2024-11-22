import '/components/footer/footer_widget.dart';
import '/components/nav_bar/nav_bar_widget.dart';
import '/components/nav_bar_mob/nav_bar_mob_widget.dart';
import '/components/redes/redes_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'finance_copy_widget.dart' show FinanceCopyWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FinanceCopyModel extends FlutterFlowModel<FinanceCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar component.
  late NavBarModel navBarModel;
  // Model for NavBarMob component.
  late NavBarMobModel navBarMobModel;
  // Model for Redes component.
  late RedesModel redesModel;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    navBarMobModel = createModel(context, () => NavBarMobModel());
    redesModel = createModel(context, () => RedesModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
    navBarMobModel.dispose();
    redesModel.dispose();
    footerModel.dispose();
  }
}
