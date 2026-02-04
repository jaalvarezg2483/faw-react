import '/backend/backend.dart';
import '/components/footer/footer_widget.dart';
import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/components/nav_barv2/nav_barv2_widget.dart';
import '/components/redes/redes_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'model_gallery_widget.dart' show ModelGalleryWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ModelGalleryModel extends FlutterFlowModel<ModelGalleryWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBarv2 component.
  late NavBarv2Model navBarv2Model;
  // Model for NavBarMobv2 component.
  late NavBarMobv2Model navBarMobv2Model;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController1;
  int carouselCurrentIndex1 = 0;

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController2;
  int carouselCurrentIndex2 = 0;

  // State field(s) for CarouselIn1 widget.
  CarouselSliderController? carouselIn1Controller;
  int carouselIn1CurrentIndex = 0;

  // State field(s) for CarouselIn2 widget.
  CarouselSliderController? carouselIn2Controller;
  int carouselIn2CurrentIndex = 0;

  // Model for Redes component.
  late RedesModel redesModel;
  // Model for Footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    navBarv2Model = createModel(context, () => NavBarv2Model());
    navBarMobv2Model = createModel(context, () => NavBarMobv2Model());
    redesModel = createModel(context, () => RedesModel());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    navBarv2Model.dispose();
    navBarMobv2Model.dispose();
    redesModel.dispose();
    footerModel.dispose();
  }
}
