import '/backend/backend.dart';
import '/components/feature_bullet_widget.dart';
import '/components/feature_card_widget.dart';
import '/components/footer/footer_widget.dart';
import '/components/maintenance_plan_item_widget.dart';
import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/components/nav_barv2/nav_barv2_widget.dart';
import '/components/redes/redes_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'model_widget.dart' show ModelWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModelModel extends FlutterFlowModel<ModelWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarv2 component.
  late NavBarv2Model navBarv2Model;
  // Model for NavBarMobv2 component.
  late NavBarMobv2Model navBarMobv2Model;
  // Models for FeatureCard dynamic component.
  late FlutterFlowDynamicModels<FeatureCardModel> featureCardModels;
  // Models for FeatureBullet dynamic component.
  late FlutterFlowDynamicModels<FeatureBulletModel> featureBulletModels;
  // Models for MaintenancePlanItem dynamic component.
  late FlutterFlowDynamicModels<MaintenancePlanItemModel>
      maintenancePlanItemModels;
  // Model for Redes component.
  late RedesModel redesModel;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    navBarv2Model = createModel(context, () => NavBarv2Model());
    navBarMobv2Model = createModel(context, () => NavBarMobv2Model());
    featureCardModels = FlutterFlowDynamicModels(() => FeatureCardModel());
    featureBulletModels = FlutterFlowDynamicModels(() => FeatureBulletModel());
    maintenancePlanItemModels =
        FlutterFlowDynamicModels(() => MaintenancePlanItemModel());
    redesModel = createModel(context, () => RedesModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    navBarv2Model.dispose();
    navBarMobv2Model.dispose();
    featureCardModels.dispose();
    featureBulletModels.dispose();
    maintenancePlanItemModels.dispose();
    redesModel.dispose();
    footerModel.dispose();
  }
}
