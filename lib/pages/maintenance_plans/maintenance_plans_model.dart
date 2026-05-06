import '/backend/backend.dart';
import '/components/banner_section_widget.dart';
import '/components/footer/footer_widget.dart';
import '/components/maintenance_plan_item_widget.dart';
import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/components/nav_barv2/nav_barv2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'maintenance_plans_widget.dart' show MaintenancePlansWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MaintenancePlansModel extends FlutterFlowModel<MaintenancePlansWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarv2 component.
  late NavBarv2Model navBarv2Model;
  // Model for NavBarMobv2 component.
  late NavBarMobv2Model navBarMobv2Model;
  // Model for BannerSection component.
  late BannerSectionModel bannerSectionModel;
  // Models for MaintenancePlanItem dynamic component.
  late FlutterFlowDynamicModels<MaintenancePlanItemModel>
      maintenancePlanItemModels;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    navBarv2Model = createModel(context, () => NavBarv2Model());
    navBarMobv2Model = createModel(context, () => NavBarMobv2Model());
    bannerSectionModel = createModel(context, () => BannerSectionModel());
    maintenancePlanItemModels =
        FlutterFlowDynamicModels(() => MaintenancePlanItemModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    navBarv2Model.dispose();
    navBarMobv2Model.dispose();
    bannerSectionModel.dispose();
    maintenancePlanItemModels.dispose();
    footerModel.dispose();
  }
}
