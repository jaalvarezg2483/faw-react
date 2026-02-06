import '/components/footer/footer_widget.dart';
import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/components/nav_barv2/nav_barv2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'purdy_drive_model.dart';
export 'purdy_drive_model.dart';

class PurdyDriveWidget extends StatefulWidget {
  const PurdyDriveWidget({super.key});

  static String routeName = 'PurdyDrive';
  static String routePath = '/purdy-drive';

  @override
  State<PurdyDriveWidget> createState() => _PurdyDriveWidgetState();
}

class _PurdyDriveWidgetState extends State<PurdyDriveWidget> {
  late PurdyDriveModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PurdyDriveModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'PurdyDrive'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
                tabletLandscape: false,
              ))
                wrapWithModel(
                  model: _model.navBarv2Model,
                  updateCallback: () => safeSetState(() {}),
                  child: NavBarv2Widget(),
                ),
              if (responsiveVisibility(
                context: context,
                desktop: false,
              ))
                Container(
                  decoration: BoxDecoration(),
                  child: wrapWithModel(
                    model: _model.navBarMobv2Model,
                    updateCallback: () => safeSetState(() {}),
                    child: NavBarMobv2Widget(),
                  ),
                ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width <
                                        kBreakpointMedium
                                    ? 40.0
                                    : 100.0,
                                0.0,
                              ),
                              40.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width <
                                        kBreakpointMedium
                                    ? 40.0
                                    : 100.0,
                                0.0,
                              ),
                              40.0),
                          child: Wrap(
                            spacing: 14.0,
                            runSpacing: 33.0,
                            alignment: WrapAlignment.spaceAround,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.sizeOf(context).width >
                                          kBreakpointMedium
                                      ? (MediaQuery.sizeOf(context).width * 0.4)
                                      : MediaQuery.sizeOf(context).width,
                                ),
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Purdy Drive',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                              .width <
                                                          kBreakpointMedium
                                                      ? 28.0
                                                      : 35.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                      Text(
                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim ',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ].divide(SizedBox(height: 13.0)),
                                  ),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.sizeOf(context).width >
                                          kBreakpointMedium
                                      ? (MediaQuery.sizeOf(context).width * 0.4)
                                      : MediaQuery.sizeOf(context).width,
                                ),
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        'https://picsum.photos/seed/483/600',
                                        width: 622.0,
                                        height: 297.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width <
                                        kBreakpointMedium
                                    ? 40.0
                                    : 100.0,
                                0.0,
                              ),
                              40.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width <
                                        kBreakpointMedium
                                    ? 40.0
                                    : 100.0,
                                0.0,
                              ),
                              40.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    child: Text(
                                      'Aprendé con nosotros lo mejores tips sobre:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointMedium
                                                ? 22.0
                                                : 28.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 40.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Wrap(
                                          spacing: 15.0,
                                          runSpacing: 26.0,
                                          alignment: WrapAlignment.spaceAround,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment:
                                              WrapAlignment.spaceAround,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: [
                                            Container(
                                              width: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return MediaQuery.sizeOf(
                                                          context)
                                                      .width;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    1100.0) {
                                                  return (MediaQuery.sizeOf(
                                                              context)
                                                          .width *
                                                      0.35);
                                                } else {
                                                  return (MediaQuery.sizeOf(
                                                              context)
                                                          .width *
                                                      0.4);
                                                }
                                              }(),
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/shield-check_1.png',
                                                      width: 46.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  11.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamc',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return MediaQuery.sizeOf(
                                                          context)
                                                      .width;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    1100.0) {
                                                  return (MediaQuery.sizeOf(
                                                              context)
                                                          .width *
                                                      0.35);
                                                } else {
                                                  return (MediaQuery.sizeOf(
                                                              context)
                                                          .width *
                                                      0.4);
                                                }
                                              }(),
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/shield-check_1.png',
                                                      width: 46.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  11.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamc',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return MediaQuery.sizeOf(
                                                          context)
                                                      .width;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    1100.0) {
                                                  return (MediaQuery.sizeOf(
                                                              context)
                                                          .width *
                                                      0.35);
                                                } else {
                                                  return (MediaQuery.sizeOf(
                                                              context)
                                                          .width *
                                                      0.4);
                                                }
                                              }(),
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/shield-check_1.png',
                                                      width: 46.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  11.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamc',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: () {
                                                if (MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall) {
                                                  return MediaQuery.sizeOf(
                                                          context)
                                                      .width;
                                                } else if (MediaQuery.sizeOf(
                                                            context)
                                                        .width <
                                                    1100.0) {
                                                  return (MediaQuery.sizeOf(
                                                              context)
                                                          .width *
                                                      0.35);
                                                } else {
                                                  return (MediaQuery.sizeOf(
                                                              context)
                                                          .width *
                                                      0.4);
                                                }
                                              }(),
                                              decoration: BoxDecoration(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image.asset(
                                                      'assets/images/shield-check_1.png',
                                                      width: 46.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  11.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamc',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 18.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 40.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: '¡Consultá con Post Venta!',
                                  options: FFButtonOptions(
                                    width: 490.0,
                                    height: 52.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          font: GoogleFonts.interTight(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 15.0)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: wrapWithModel(
                          model: _model.footerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: FooterWidget(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
