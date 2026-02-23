import '/backend/backend.dart';
import '/components/footer/footer_widget.dart';
import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/components/nav_barv2/nav_barv2_widget.dart';
import '/components/site_map_section_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'site_map_widget.dart' show SiteMapWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SiteMapModel extends FlutterFlowModel<SiteMapWidget> {
  ///  Local state fields for this page.

  String buttomActive = 'contacto';

  bool selected = false;

  bool isIdNotSelected = false;

  bool isTermsNotSelect = false;

  ///  State fields for stateful widgets in this page.

  // Model for NavBarv2 component.
  late NavBarv2Model navBarv2Model;
  // Model for NavBarMobv2 component.
  late NavBarMobv2Model navBarMobv2Model;
  // Model for SiteMapSectionHeader component.
  late SiteMapSectionHeaderModel siteMapSectionHeaderModel1;
  // Model for SiteMapSectionHeader component.
  late SiteMapSectionHeaderModel siteMapSectionHeaderModel2;
  // Model for SiteMapSectionHeader component.
  late SiteMapSectionHeaderModel siteMapSectionHeaderModel3;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    navBarv2Model = createModel(context, () => NavBarv2Model());
    navBarMobv2Model = createModel(context, () => NavBarMobv2Model());
    siteMapSectionHeaderModel1 =
        createModel(context, () => SiteMapSectionHeaderModel());
    siteMapSectionHeaderModel2 =
        createModel(context, () => SiteMapSectionHeaderModel());
    siteMapSectionHeaderModel3 =
        createModel(context, () => SiteMapSectionHeaderModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    navBarv2Model.dispose();
    navBarMobv2Model.dispose();
    siteMapSectionHeaderModel1.dispose();
    siteMapSectionHeaderModel2.dispose();
    siteMapSectionHeaderModel3.dispose();
    footerModel.dispose();
  }
}
