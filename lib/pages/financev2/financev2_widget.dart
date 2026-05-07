import '/backend/backend.dart';
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
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'financev2_model.dart';
export 'financev2_model.dart';

class Financev2Widget extends StatefulWidget {
  const Financev2Widget({
    super.key,
    this.vehicle,
  });

  final ModelsRecord? vehicle;

  static String routeName = 'Financev2';
  static String routePath = '/financiamiento';

  @override
  State<Financev2Widget> createState() => _Financev2WidgetState();
}

class _Financev2WidgetState extends State<Financev2Widget> {
  late Financev2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Financev2Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Financev2'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('FINANCEV2_PAGE_Financev2_ON_INIT_STATE');
      await actions.updateMetaTags(
        'Financiamiento | Faw Trucks Costa Rica | Grupo Purdy',
        'Conocé las opciones de financiamiento de Faw Trucks Costa Rica con el respaldo de Grupo Purdy. ¡Solicitalo hoy mismo y mové tu negocio!',
        'Financiamiento camiones, financiamiento Faw Trucks',
      );
      FFAppState().menuOptionActive = 'Financiamiento';
      safeSetState(() {});
      if (widget!.vehicle != null) {
        _model.paso = 2;
        safeSetState(() {});
      }
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
                                40.0,
                                valueOrDefault<double>(
                                  MediaQuery.sizeOf(context).width <
                                          kBreakpointSmall
                                      ? 40.0
                                      : 100.0,
                                  0.0,
                                ),
                                25.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Calcular financiamiento',
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            fontSize: MediaQuery.sizeOf(context)
                                                        .width <
                                                    kBreakpointSmall
                                                ? 25.0
                                                : 30.0,
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
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 13.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          '1',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width <
                                                    kBreakpointSmall
                                                ? 90.0
                                                : 200.0,
                                        height: 7.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: _model.paso == 2
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          '2',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                fontSize: 22.0,
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
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Camión',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width <
                                              kBreakpointSmall
                                          ? 80.0
                                          : 190.0,
                                      height: 7.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    ),
                                    Text(
                                      'Cálculo',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ].divide(SizedBox(height: 12.0)),
                            ),
                          ),
                        ),
                        if (_model.paso == 1)
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
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
                                  0.0,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Seleccioná el modelo de tu interés para que podás agregar Planes de Mantenimiento y ver diferentes opciones bancarias.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
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
                                                  letterSpacing: 0.0,
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
                                      ],
                                    ),
                                  ),
                                  StreamBuilder<List<ModelsRecord>>(
                                    stream: queryModelsRecord(),
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
                                        spacing: 0.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: List.generate(
                                            wrapModelsRecordList.length,
                                            (wrapIndex) {
                                          final wrapModelsRecord =
                                              wrapModelsRecordList[wrapIndex];
                                          return FinanceCardVehicleWidget(
                                            key: Key(
                                                'Keyusk_${wrapIndex}_of_${wrapModelsRecordList.length}'),
                                            vehicle: wrapModelsRecord,
                                            callback: () async {
                                              logFirebaseEvent(
                                                  'FINANCEV2_Container_uskettet_CALLBACK');
                                              _model.vehicleSelected =
                                                  wrapModelsRecord;
                                              safeSetState(() {});
                                            },
                                          );
                                        }),
                                      );
                                    },
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
                        if ((_model.paso == 2) &&
                            (_model.vehicleSelected != null))
                          Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall
                                        ? 30.0
                                        : 80.0,
                                    0.0,
                                  ),
                                  0.0,
                                  valueOrDefault<double>(
                                    MediaQuery.sizeOf(context).width <
                                            kBreakpointSmall
                                        ? 30.0
                                        : 80.0,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width <
                                                  kBreakpointMedium
                                              ? 0.0
                                              : 120.0,
                                          0.0,
                                        ),
                                        20.0,
                                        valueOrDefault<double>(
                                          MediaQuery.sizeOf(context).width <
                                                  kBreakpointMedium
                                              ? 0.0
                                              : 120.0,
                                          0.0,
                                        ),
                                        0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                _model.vehicleSelected?.name,
                                                'Modelo',
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          kBreakpointSmall) {
                                                        return 25.0;
                                                      } else if (MediaQuery
                                                                  .sizeOf(
                                                                      context)
                                                              .width <
                                                          kBreakpointMedium) {
                                                        return 30.0;
                                                      } else {
                                                        return 40.0;
                                                      }
                                                    }(),
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Detalle de al orden',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'Total \$${(_model.vehicleSelected?.promoPrice != null) && (_model.vehicleSelected!.promoPrice < _model.vehicleSelected!.priceBase.toDouble()) ? _model.vehicleSelected?.promoPrice?.toString() : _model.vehicleSelected?.priceBase?.toString()}',
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text:
                                              'Ir a PURDY GO y reservar en línea',
                                          options: FFButtonOptions(
                                            width: 300.0,
                                            height: 54.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.interTight(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 21.0, 0.0, 0.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              _model.vehicleSelected!.urlImage,
                                              width: 600.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 7.0)),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          32.0, 20.0, 32.0, 30.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Text(
                                              'Entidades disponibles',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 650.0,
                                            child: CarouselSlider(
                                              items: [
                                                wrapWithModel(
                                                  model: _model.bankCardModel1,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: BankCardWidget(),
                                                ),
                                                wrapWithModel(
                                                  model: _model.bankCardModel2,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: BankCardWidget(),
                                                ),
                                                wrapWithModel(
                                                  model: _model.bankCardModel3,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: BankCardWidget(),
                                                ),
                                              ],
                                              carouselController: _model
                                                      .carouselController ??=
                                                  CarouselSliderController(),
                                              options: CarouselOptions(
                                                initialPage: 2,
                                                viewportFraction: 0.33,
                                                disableCenter: true,
                                                enlargeCenterPage: true,
                                                enlargeFactor: 0.25,
                                                enableInfiniteScroll: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                autoPlay: false,
                                                onPageChanged: (index, _) =>
                                                    _model.carouselCurrentIndex =
                                                        index,
                                              ),
                                            ),
                                          ),
                                        ].divide(SizedBox(height: 18.0)),
                                      ),
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
