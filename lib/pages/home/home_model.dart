import '/backend/backend.dart';
import '/components/footer/footer_widget.dart';
import '/components/home_banner/home_banner_widget.dart';
import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/components/nav_barv2/nav_barv2_widget.dart';
import '/components/section_title_with_button/section_title_with_button_widget.dart';
import '/components/vehicle_card/vehicle_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool isIdNotSelected = false;

  bool isTermsNotSelect = false;

  bool selected = false;

  ///  State fields for stateful widgets in this page.

  // Model for NavBarv2 component.
  late NavBarv2Model navBarv2Model;
  // Model for NavBarMobv2 component.
  late NavBarMobv2Model navBarMobv2Model;
  // Model for HomeBanner component.
  late HomeBannerModel homeBannerModel;
  // Models for VehicleCard dynamic component.
  late FlutterFlowDynamicModels<VehicleCardModel> vehicleCardModels1;
  // Models for VehicleCard dynamic component.
  late FlutterFlowDynamicModels<VehicleCardModel> vehicleCardModels2;
  // Model for SectionTitleWithButton component.
  late SectionTitleWithButtonModel sectionTitleWithButtonModel1;
  // Model for SectionTitleWithButton component.
  late SectionTitleWithButtonModel sectionTitleWithButtonModel2;
  // Model for SectionTitleWithButton component.
  late SectionTitleWithButtonModel sectionTitleWithButtonModel3;
  // Model for SectionTitleWithButton component.
  late SectionTitleWithButtonModel sectionTitleWithButtonModel4;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    navBarv2Model = createModel(context, () => NavBarv2Model());
    navBarMobv2Model = createModel(context, () => NavBarMobv2Model());
    homeBannerModel = createModel(context, () => HomeBannerModel());
    vehicleCardModels1 = FlutterFlowDynamicModels(() => VehicleCardModel());
    vehicleCardModels2 = FlutterFlowDynamicModels(() => VehicleCardModel());
    sectionTitleWithButtonModel1 =
        createModel(context, () => SectionTitleWithButtonModel());
    sectionTitleWithButtonModel2 =
        createModel(context, () => SectionTitleWithButtonModel());
    sectionTitleWithButtonModel3 =
        createModel(context, () => SectionTitleWithButtonModel());
    sectionTitleWithButtonModel4 =
        createModel(context, () => SectionTitleWithButtonModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    navBarv2Model.dispose();
    navBarMobv2Model.dispose();
    homeBannerModel.dispose();
    vehicleCardModels1.dispose();
    vehicleCardModels2.dispose();
    sectionTitleWithButtonModel1.dispose();
    sectionTitleWithButtonModel2.dispose();
    sectionTitleWithButtonModel3.dispose();
    sectionTitleWithButtonModel4.dispose();
    footerModel.dispose();
  }
}
