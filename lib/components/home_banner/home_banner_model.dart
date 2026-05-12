import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'home_banner_widget.dart' show HomeBannerWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeBannerModel extends FlutterFlowModel<HomeBannerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CarouselDesktop widget.
  CarouselSliderController? carouselDesktopController;
  int carouselDesktopCurrentIndex = 0;

  // State field(s) for CarouselMobile widget.
  CarouselSliderController? carouselMobileController;
  int carouselMobileCurrentIndex = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
