import '/backend/backend.dart';
import '/components/footer/footer_widget.dart';
import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/components/nav_barv2/nav_barv2_widget.dart';
import '/components/vehicle_card/vehicle_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'models_model.dart';
export 'models_model.dart';

class ModelsWidget extends StatefulWidget {
  const ModelsWidget({super.key});

  static String routeName = 'Models';
  static String routePath = '/models';

  @override
  State<ModelsWidget> createState() => _ModelsWidgetState();
}

class _ModelsWidgetState extends State<ModelsWidget> {
  late ModelsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModelsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Models'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: wrapWithModel(
                  model: _model.navBarMobv2Model,
                  updateCallback: () => safeSetState(() {}),
                  child: NavBarMobv2Widget(),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 34.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    () {
                                      if (MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall) {
                                        return 40.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointMedium) {
                                        return 40.0;
                                      } else if (MediaQuery.sizeOf(context)
                                              .width <
                                          kBreakpointLarge) {
                                        return 60.0;
                                      } else {
                                        return 60.0;
                                      }
                                    }(),
                                    0.0,
                                  ),
                                  34.0,
                                  0.0,
                                  34.0),
                              child: Text(
                                'Camiones:',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      fontSize:
                                          MediaQuery.sizeOf(context).width <
                                                  500.0
                                              ? 18.0
                                              : 35.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    valueOrDefault<double>(
                                      () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 40.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 40.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 60.0;
                                        } else {
                                          return 60.0;
                                        }
                                      }(),
                                      0.0,
                                    ),
                                    0.0,
                                    valueOrDefault<double>(
                                      () {
                                        if (MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall) {
                                          return 40.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointMedium) {
                                          return 40.0;
                                        } else if (MediaQuery.sizeOf(context)
                                                .width <
                                            kBreakpointLarge) {
                                          return 60.0;
                                        } else {
                                          return 60.0;
                                        }
                                      }(),
                                      0.0,
                                    ),
                                    0.0),
                                child: StreamBuilder<List<ModelsRecord>>(
                                  stream: queryModelsRecord(
                                    queryBuilder: (modelsRecord) => modelsRecord
                                        .where(
                                          'enable',
                                          isEqualTo: true,
                                        )
                                        .where(
                                          'type',
                                          isEqualTo: 'Camion',
                                        )
                                        .where(
                                          'isProd',
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
                                    List<ModelsRecord> wrapModelsRecordList =
                                        snapshot.data!;

                                    return Wrap(
                                      spacing: 35.0,
                                      runSpacing: 35.0,
                                      alignment: WrapAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.center,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: List.generate(
                                          wrapModelsRecordList.length,
                                          (wrapIndex) {
                                        final wrapModelsRecord =
                                            wrapModelsRecordList[wrapIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 30.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'MODELS_PAGE_Container_vhmrss3q_ON_TAP');

                                              context.pushNamed(
                                                ModelWidget.routeName,
                                                pathParameters: {
                                                  'slug': serializeParam(
                                                    wrapModelsRecord.slug,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: wrapWithModel(
                                              model: _model.vehicleCardModels
                                                  .getModel(
                                                wrapIndex.toString(),
                                                wrapIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: VehicleCardWidget(
                                                key: Key(
                                                  'Keyvhm_${wrapIndex.toString()}',
                                                ),
                                                name: wrapModelsRecord.name,
                                                passengers:
                                                    wrapModelsRecord.passengers,
                                                transmission: wrapModelsRecord
                                                    .transmission,
                                                code: wrapModelsRecord.code,
                                                price: wrapModelsRecord
                                                    .priceBase
                                                    .toDouble(),
                                                urlImage:
                                                    wrapModelsRecord.urlImage,
                                                urlTechSpec: wrapModelsRecord
                                                    .urlTechSpec,
                                                promoPrice:
                                                    wrapModelsRecord.promoPrice,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ].divide(SizedBox(height: 32.0)),
                        ),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
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
