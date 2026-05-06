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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'site_map_model.dart';
export 'site_map_model.dart';

class SiteMapWidget extends StatefulWidget {
  const SiteMapWidget({
    super.key,
    this.buttonActivePreLoaded,
  });

  final String? buttonActivePreLoaded;

  static String routeName = 'SiteMap';
  static String routePath = '/sitemap';

  @override
  State<SiteMapWidget> createState() => _SiteMapWidgetState();
}

class _SiteMapWidgetState extends State<SiteMapWidget> {
  late SiteMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SiteMapModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'SiteMap'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SITE_MAP_PAGE_SiteMap_ON_INIT_STATE');
      if (widget!.buttonActivePreLoaded != null &&
          widget!.buttonActivePreLoaded != '') {
        _model.buttomActive = widget!.buttonActivePreLoaded!;
        safeSetState(() {});
      } else {
        _model.buttomActive = 'Contacto';
        safeSetState(() {});
      }

      FFAppState().menuOptionActive = 'Contactanos';
      safeSetState(() {});
      await actions.updateMetaTags(
        'Contactanos | Faw Trucks Costa Rica | Grupo Purdy',
        'Contactanos en Faw Trucks Costa Rica con el respaldo de Grupo Purdy. ¡Escribinos hoy y llevá tu negocio al siguiente nivel!',
        'contactanos, Faw Trucks Costa Rica, Grupo Purdy',
      );
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                                        kBreakpointSmall
                                    ? 40.0
                                    : 100.0,
                                0.0,
                              ),
                              0.0,
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width <
                                        kBreakpointSmall
                                    ? 40.0
                                    : 100.0,
                                0.0,
                              ),
                              0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 60.0, 0.0, 30.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment: AlignmentDirectional(
                                            valueOrDefault<double>(
                                              MediaQuery.sizeOf(context).width <
                                                      kBreakpointSmall
                                                  ? 0.0
                                                  : -1.0,
                                              0.0,
                                            ),
                                            0.0),
                                        child: Text(
                                          'Mapa del sitio',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.siteMapSectionHeaderModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: SiteMapSectionHeaderWidget(
                                    title: 'Vehículos',
                                  ),
                                ),
                              ),
                              Container(
                                child: StreamBuilder<List<ModelsRecord>>(
                                  stream: queryModelsRecord(
                                    queryBuilder: (modelsRecord) => modelsRecord
                                        .where(
                                          'enable',
                                          isEqualTo: true,
                                        )
                                        .orderBy('order'),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<ModelsRecord>
                                        gridViewModelsModelsRecordList =
                                        snapshot.data!;

                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: valueOrDefault<int>(
                                          () {
                                            if (MediaQuery.sizeOf(context)
                                                    .width <
                                                kBreakpointSmall) {
                                              return 1;
                                            } else if (MediaQuery.sizeOf(
                                                        context)
                                                    .width <
                                                kBreakpointLarge) {
                                              return 2;
                                            } else {
                                              return 4;
                                            }
                                          }(),
                                          4,
                                        ),
                                        crossAxisSpacing:
                                            valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width <
                                                  kBreakpointSmall
                                              ? 2.0
                                              : 10.0,
                                          10.0,
                                        ),
                                        mainAxisSpacing:
                                            MediaQuery.sizeOf(context).width <
                                                    kBreakpointSmall
                                                ? 2.0
                                                : 10.0,
                                        childAspectRatio:
                                            valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width <
                                                  kBreakpointSmall
                                              ? 5.0
                                              : 2.0,
                                          2.0,
                                        ),
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          gridViewModelsModelsRecordList.length,
                                      itemBuilder:
                                          (context, gridViewModelsIndex) {
                                        final gridViewModelsModelsRecord =
                                            gridViewModelsModelsRecordList[
                                                gridViewModelsIndex];
                                        return Align(
                                          alignment: AlignmentDirectional(
                                              valueOrDefault<double>(
                                                MediaQuery.sizeOf(context)
                                                            .width <
                                                        kBreakpointSmall
                                                    ? 0.0
                                                    : -1.0,
                                                0.0,
                                              ),
                                              -1.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'SITE_MAP_PAGE_TextModel_ON_TAP');

                                              context.pushNamed(
                                                ModelWidget.routeName,
                                                pathParameters: {
                                                  'slug': serializeParam(
                                                    gridViewModelsModelsRecord
                                                        .slug,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Text(
                                              gridViewModelsModelsRecord.name,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.siteMapSectionHeaderModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: SiteMapSectionHeaderWidget(
                                    title: 'Contactanos',
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: GridView(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: valueOrDefault<int>(
                                      () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 1;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 2;
                                        } else {
                                          return 4;
                                        }
                                      }(),
                                      4,
                                    ),
                                    crossAxisSpacing: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall
                                          ? 2.0
                                          : 10.0,
                                      10.0,
                                    ),
                                    mainAxisSpacing:
                                        MediaQuery.sizeOf(context).width <
                                                kBreakpointSmall
                                            ? 2.0
                                            : 10.0,
                                    childAspectRatio: valueOrDefault<double>(
                                      MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall
                                          ? 5.0
                                          : 2.0,
                                      2.0,
                                    ),
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width <
                                                    kBreakpointSmall
                                                ? 0.0
                                                : -1.0,
                                            0.0,
                                          ),
                                          -1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SITE_MAP_PAGE_TextContactanos_ON_TAP');

                                          context.pushNamed(
                                              ContactUsWidget.routeName);
                                        },
                                        child: Text(
                                          'Contactanos',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width <
                                                    kBreakpointSmall
                                                ? 0.0
                                                : -1.0,
                                            0.0,
                                          ),
                                          -1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SITE_MAP_PAGE_TextSucursales_ON_TAP');

                                          context.pushNamed(
                                              WorkshopsWidget.routeName);
                                        },
                                        child: Text(
                                          'Sucursales',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width <
                                                    kBreakpointSmall
                                                ? 0.0
                                                : -1.0,
                                            0.0,
                                          ),
                                          -1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SITE_MAP_PAGE_TextTalleres_ON_TAP');

                                          context.pushNamed(
                                              WorkshopsWidget.routeName);
                                        },
                                        child: Text(
                                          'Talleres',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.siteMapSectionHeaderModel3,
                                  updateCallback: () => safeSetState(() {}),
                                  child: SiteMapSectionHeaderWidget(
                                    title: 'Adicionales',
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(),
                                child: GridView(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: valueOrDefault<int>(
                                      () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 1;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 4;
                                        } else {
                                          return 4;
                                        }
                                      }(),
                                      4,
                                    ),
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    childAspectRatio:
                                        MediaQuery.sizeOf(context).width <
                                                kBreakpointSmall
                                            ? 5.0
                                            : 2.0,
                                  ),
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width <
                                                    kBreakpointSmall
                                                ? 0.0
                                                : -1.0,
                                            0.0,
                                          ),
                                          -1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SITE_MAP_TextCalcularfinanciamiento_ON_T');

                                          context.pushNamed(
                                              Financev1Widget.routeName);
                                        },
                                        child: Text(
                                          'Calcular financiamiento',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width <
                                                    kBreakpointSmall
                                                ? 0.0
                                                : -1.0,
                                            0.0,
                                          ),
                                          -1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SITE_MAP_PAGE_TextTerms_ON_TAP');

                                          context
                                              .pushNamed(TermsWidget.routeName);
                                        },
                                        child: Text(
                                          'Términos y condiciones',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width <
                                                    kBreakpointSmall
                                                ? 0.0
                                                : -1.0,
                                            0.0,
                                          ),
                                          -1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SITE_MAP_PAGE_TextRules_ON_TAP');

                                          context
                                              .pushNamed(TermsWidget.routeName);
                                        },
                                        child: Text(
                                          'Reglamento',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(
                                          valueOrDefault<double>(
                                            MediaQuery.sizeOf(context).width <
                                                    kBreakpointSmall
                                                ? 0.0
                                                : -1.0,
                                            0.0,
                                          ),
                                          -1.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'SITE_MAP_PAGE_TextCookies_ON_TAP');
                                          await launchURL(
                                              'https://firebasestorage.googleapis.com/v0/b/higer-cms.appspot.com/o/Documentos%2Fzzzzzzzzzzzzzzzzzzzy%2Ffile%2FbXxxgVVzrMhQlNuSRB6t-POL%C3%8DTICA%20DE%20COOKIES%20Higer.pdf?alt=media&token=b1d61921-995a-4799-b66c-14381eda65dd');
                                        },
                                        child: Text(
                                          'Cookies',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
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
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
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
