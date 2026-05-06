import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'banner_section_model.dart';
export 'banner_section_model.dart';

class BannerSectionWidget extends StatefulWidget {
  const BannerSectionWidget({
    super.key,
    required this.bannerUrlWeb,
    required this.bannerUrlMobile,
  });

  final String? bannerUrlWeb;
  final String? bannerUrlMobile;

  @override
  State<BannerSectionWidget> createState() => _BannerSectionWidgetState();
}

class _BannerSectionWidgetState extends State<BannerSectionWidget> {
  late BannerSectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BannerSectionModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
          tabletLandscape: false,
        ))
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.network(
                widget!.bannerUrlWeb!,
                fit: BoxFit.cover,
                alignment: Alignment(0.0, -1.0),
              ),
            ),
          ),
        if (responsiveVisibility(
          context: context,
          phone: false,
          desktop: false,
        ))
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: () {
              if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                return (MediaQuery.sizeOf(context).width * 0.55);
              } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                return (MediaQuery.sizeOf(context).width * 0.55);
              } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                return (MediaQuery.sizeOf(context).width * 0.35);
              } else {
                return (MediaQuery.sizeOf(context).width * 0.35);
              }
            }(),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.network(
                widget!.bannerUrlWeb!,
                fit: BoxFit.cover,
                alignment: Alignment(0.0, -1.0),
              ),
            ),
          ),
        if (responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        ))
          Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0.0),
              child: Image.network(
                widget!.bannerUrlMobile!,
                width: 100.0,
                fit: BoxFit.cover,
                alignment: Alignment(0.0, -1.0),
              ),
            ),
          ),
      ],
    );
  }
}
