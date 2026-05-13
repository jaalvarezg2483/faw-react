import '/components/footer/footer_widget.dart';
import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/components/nav_barv2/nav_barv2_widget.dart';
import '/components/redes/redes_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reglaments_model.dart';
export 'reglaments_model.dart';

class ReglamentsWidget extends StatefulWidget {
  const ReglamentsWidget({super.key});

  static String routeName = 'Reglaments';
  static String routePath = '/reglamento';

  @override
  State<ReglamentsWidget> createState() => _ReglamentsWidgetState();
}

class _ReglamentsWidgetState extends State<ReglamentsWidget> {
  late ReglamentsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReglamentsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Reglaments'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('REGLAMENTS_PAGE_Reglaments_ON_INIT_STATE');
      await actions.updateMetaTags(
        'Financiamiento | Faw Trucks Costa Rica | Grupo Purdy',
        'Conocé las opciones de financiamiento de Faw Trucks Costa Rica con el respaldo de Grupo Purdy. ¡Solicitalo hoy mismo y mové tu negocio!',
        'Financiamiento camiones, financiamiento Faw Trucks',
      );
      FFAppState().menuOptionActive = 'Financiamiento';
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  wrapWithModel(
                    model: _model.navBarv2Model,
                    updateCallback: () => safeSetState(() {}),
                    child: NavBarv2Widget(),
                  ),
                Container(
                  child: wrapWithModel(
                    model: _model.navBarMobv2Model,
                    updateCallback: () => safeSetState(() {}),
                    child: NavBarMobv2Widget(),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    primary: false,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 600.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall
                                      ? 40.0
                                      : 100.0,
                                  0.0,
                                ),
                                60.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall
                                      ? 40.0
                                      : 100.0,
                                  0.0,
                                ),
                                valueOrDefault<double>(
                                  () {
                                    if (MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall) {
                                      return 60.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointMedium) {
                                      return 60.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        kBreakpointLarge) {
                                      return 200.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        1280.0) {
                                      return 400.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        1500.0) {
                                      return 60.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        2000.0) {
                                      return 250.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        2250.0) {
                                      return 350.0;
                                    } else if (MediaQuery.sizeOf(context)
                                            .width <
                                        2500.0) {
                                      return 600.0;
                                    } else {
                                      return 60.0;
                                    }
                                  }(),
                                  0.0,
                                )),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 30.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Reglamento',
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
                                                          500.0
                                                      ? 30.0
                                                      : 40.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(SizedBox(height: () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return 15.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return 15.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return 25.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    1100.0) {
                                  return 50.0;
                                } else {
                                  return 15.0;
                                }
                              }())),
                            ),
                          ),
                        ),
                        Expanded(
                          child: wrapWithModel(
                            model: _model.redesModel,
                            updateCallback: () => safeSetState(() {}),
                            child: RedesWidget(),
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
      ),
    );
  }
}
