import '/backend/backend.dart';
import '/components/bank_card_widget.dart';
import '/components/finance_card_vehicle_widget.dart';
import '/components/footer/footer_widget.dart';
import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/components/nav_barv2/nav_barv2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'financev2_widget.dart' show Financev2Widget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Financev2Model extends FlutterFlowModel<Financev2Widget> {
  ///  Local state fields for this page.

  int? paso = 1;

  ModelsRecord? vehicleSelected;

  ///  State fields for stateful widgets in this page.

  // Model for NavBarv2 component.
  late NavBarv2Model navBarv2Model;
  // Model for NavBarMobv2 component.
  late NavBarMobv2Model navBarMobv2Model;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 2;

  // Model for bankCard component.
  late BankCardModel bankCardModel1;
  // Model for bankCard component.
  late BankCardModel bankCardModel2;
  // Model for bankCard component.
  late BankCardModel bankCardModel3;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    navBarv2Model = createModel(context, () => NavBarv2Model());
    navBarMobv2Model = createModel(context, () => NavBarMobv2Model());
    bankCardModel1 = createModel(context, () => BankCardModel());
    bankCardModel2 = createModel(context, () => BankCardModel());
    bankCardModel3 = createModel(context, () => BankCardModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    navBarv2Model.dispose();
    navBarMobv2Model.dispose();
    bankCardModel1.dispose();
    bankCardModel2.dispose();
    bankCardModel3.dispose();
    footerModel.dispose();
  }
}
