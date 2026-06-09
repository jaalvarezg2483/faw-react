import '/backend/backend.dart';
import '/components/footer/footer_widget.dart';
import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/components/nav_barv2/nav_barv2_widget.dart';
import '/components/vehicle_card/vehicle_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'vagonetas_widget.dart' show VagonetasWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VagonetasModel extends FlutterFlowModel<VagonetasWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarv2 component.
  late NavBarv2Model navBarv2Model;
  // Model for NavBarMobv2 component.
  late NavBarMobv2Model navBarMobv2Model;
  // Models for VehicleCard dynamic component.
  late FlutterFlowDynamicModels<VehicleCardModel> vehicleCardModels1;
  // Models for VehicleCard dynamic component.
  late FlutterFlowDynamicModels<VehicleCardModel> vehicleCardModels2;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    navBarv2Model = createModel(context, () => NavBarv2Model());
    navBarMobv2Model = createModel(context, () => NavBarMobv2Model());
    vehicleCardModels1 = FlutterFlowDynamicModels(() => VehicleCardModel());
    vehicleCardModels2 = FlutterFlowDynamicModels(() => VehicleCardModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    navBarv2Model.dispose();
    navBarMobv2Model.dispose();
    vehicleCardModels1.dispose();
    vehicleCardModels2.dispose();
    footerModel.dispose();
  }
}
