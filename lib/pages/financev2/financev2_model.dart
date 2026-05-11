import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/bank_card/bank_card_widget.dart';
import '/components/finance_card_vehicle_widget.dart';
import '/components/footer/footer_widget.dart';
import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/components/nav_barv2/nav_barv2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'financev2_widget.dart' show Financev2Widget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Financev2Model extends FlutterFlowModel<Financev2Widget> {
  ///  Local state fields for this page.

  int? paso = 1;

  ModelsRecord? vehicleSelected;

  List<BankStruct> bankList = [];
  void addToBankList(BankStruct item) => bankList.add(item);
  void removeFromBankList(BankStruct item) => bankList.remove(item);
  void removeAtIndexFromBankList(int index) => bankList.removeAt(index);
  void insertAtIndexInBankList(int index, BankStruct item) =>
      bankList.insert(index, item);
  void updateBankListAtIndex(int index, Function(BankStruct) updateFn) =>
      bankList[index] = updateFn(bankList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Financev2 widget.
  ModelsRecord? queryVehicleOnLoad;
  // Stores action output result for [Firestore Query - Query a collection] action in Financev2 widget.
  List<CustomPaymentTermsRecord>? banksCustomConfig;
  // Stores action output result for [Backend Call - API (getBanksData)] action in Financev2 widget.
  ApiCallResponse? getBanksData;
  // Model for NavBarv2 component.
  late NavBarv2Model navBarv2Model;
  // Model for NavBarMobv2 component.
  late NavBarMobv2Model navBarMobv2Model;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController1;
  int carouselCurrentIndex1 = 2;

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController2;
  int carouselCurrentIndex2 = 1;

  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    navBarv2Model = createModel(context, () => NavBarv2Model());
    navBarMobv2Model = createModel(context, () => NavBarMobv2Model());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    navBarv2Model.dispose();
    navBarMobv2Model.dispose();
    footerModel.dispose();
  }
}
