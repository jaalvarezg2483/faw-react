import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_banner_model.dart';
export 'home_banner_model.dart';

class HomeBannerWidget extends StatefulWidget {
  const HomeBannerWidget({
    super.key,
    String? section,
  }) : this.section = section ?? 'Home';

  final String section;

  @override
  State<HomeBannerWidget> createState() => _HomeBannerWidgetState();
}

class _HomeBannerWidgetState extends State<HomeBannerWidget> {
  late HomeBannerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeBannerModel());

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
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (responsiveVisibility(
          context: context,
          phone: false,
        ))
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Stack(
              alignment: AlignmentDirectional(0.0, 0.0),
              children: [
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                ))
                  StreamBuilder<List<BannersRecord>>(
                    stream: queryBannersRecord(
                      queryBuilder: (bannersRecord) => bannersRecord
                          .where(
                            'section',
                            isEqualTo: widget!.section,
                          )
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
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<BannersRecord> carouselDesktopBannersRecordList =
                          snapshot.data!;

                      return Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height - 100.0,
                        child: CarouselSlider.builder(
                          itemCount: carouselDesktopBannersRecordList.length,
                          itemBuilder: (context, carouselDesktopIndex, _) {
                            final carouselDesktopBannersRecord =
                                carouselDesktopBannersRecordList[
                                    carouselDesktopIndex];
                            return Builder(
                              builder: (context) {
                                if (carouselDesktopBannersRecord.type ==
                                    'IMAGE') {
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                        tablet: false,
                                        tabletLandscape: false,
                                      ))
                                        Flexible(
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            height: MediaQuery.sizeOf(context)
                                                    .height -
                                                100.0,
                                            decoration: BoxDecoration(),
                                            child: Visibility(
                                              visible: responsiveVisibility(
                                                context: context,
                                                phone: false,
                                                tablet: false,
                                                tabletLandscape: false,
                                              ),
                                              child: Image.network(
                                                carouselDesktopBannersRecord
                                                    .bannerUrl,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                        .width,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                } else if (carouselDesktopBannersRecord.type ==
                                    'VIDEO') {
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                      ))
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          height: MediaQuery.sizeOf(context)
                                                  .height -
                                              100.0,
                                          decoration: BoxDecoration(),
                                          child: FlutterFlowVideoPlayer(
                                            path: carouselDesktopBannersRecord
                                                .videoUrl,
                                            videoType: VideoType.network,
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            autoPlay: true,
                                            looping: true,
                                            showControls: false,
                                            allowFullScreen: true,
                                            allowPlaybackSpeedMenu: false,
                                          ),
                                        ),
                                    ],
                                  );
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  );
                                }
                              },
                            );
                          },
                          carouselController:
                              _model.carouselDesktopController ??=
                                  CarouselSliderController(),
                          options: CarouselOptions(
                            initialPage: max(
                                0,
                                min(
                                    0,
                                    carouselDesktopBannersRecordList.length -
                                        1)),
                            viewportFraction: 1.0,
                            disableCenter: true,
                            enlargeCenterPage: false,
                            enlargeFactor: 0.0,
                            enableInfiniteScroll: true,
                            scrollDirection: Axis.horizontal,
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 1400),
                            autoPlayInterval:
                                Duration(milliseconds: (1400 + 4000)),
                            autoPlayCurve: Curves.linear,
                            pauseAutoPlayInFiniteScroll: true,
                            onPageChanged: (index, _) =>
                                _model.carouselDesktopCurrentIndex = index,
                          ),
                        ),
                      );
                    },
                  ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 80.0,
                          buttonSize: 80.0,
                          fillColor: Color(0x4BF5F5F5),
                          icon: Icon(
                            Icons.chevron_left,
                            color: FlutterFlowTheme.of(context).info,
                            size: 50.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'HOME_BANNER_COMP_chevron_left_ICN_ON_TAP');
                            await _model.carouselDesktopController
                                ?.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderRadius: 80.0,
                          buttonSize: 80.0,
                          fillColor: Color(0x4BF5F5F5),
                          icon: Icon(
                            Icons.navigate_next,
                            color: FlutterFlowTheme.of(context).info,
                            size: 50.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'HOME_BANNER_navigate_next_ICN_ON_TAP');
                            await _model.carouselDesktopController?.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        if (responsiveVisibility(
          context: context,
          tablet: false,
          tabletLandscape: false,
          desktop: false,
        ))
          Flexible(
            child: Container(
              height: 290.0,
              child: Stack(
                alignment: AlignmentDirectional(0.0, 0.0),
                children: [
                  if (responsiveVisibility(
                    context: context,
                    tablet: false,
                    tabletLandscape: false,
                    desktop: false,
                  ))
                    StreamBuilder<List<BannersRecord>>(
                      stream: queryBannersRecord(
                        queryBuilder: (bannersRecord) => bannersRecord
                            .where(
                              'section',
                              isEqualTo: widget!.section,
                            )
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
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<BannersRecord> carouselMobileBannersRecordList =
                            snapshot.data!;

                        return Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 290.0,
                          child: CarouselSlider.builder(
                            itemCount: carouselMobileBannersRecordList.length,
                            itemBuilder: (context, carouselMobileIndex, _) {
                              final carouselMobileBannersRecord =
                                  carouselMobileBannersRecordList[
                                      carouselMobileIndex];
                              return Builder(
                                builder: (context) {
                                  if (carouselMobileBannersRecord.type ==
                                      'IMAGE') {
                                    return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Image.network(
                                            carouselMobileBannersRecord
                                                .bannerUrlMobile,
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            height: 290.0,
                                            fit: BoxFit.cover,
                                          ),
                                      ],
                                    );
                                  } else if (carouselMobileBannersRecord.type ==
                                      'VIDEO') {
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        if (responsiveVisibility(
                                          context: context,
                                          tablet: false,
                                          tabletLandscape: false,
                                          desktop: false,
                                        ))
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            decoration: BoxDecoration(),
                                            child: FlutterFlowVideoPlayer(
                                              path: carouselMobileBannersRecord
                                                  .videoMobileUrl,
                                              videoType: VideoType.network,
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              autoPlay: true,
                                              looping: true,
                                              showControls: false,
                                              allowFullScreen: true,
                                              allowPlaybackSpeedMenu: false,
                                            ),
                                          ),
                                      ],
                                    );
                                  } else {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                            carouselController:
                                _model.carouselMobileController ??=
                                    CarouselSliderController(),
                            options: CarouselOptions(
                              initialPage: max(
                                  0,
                                  min(
                                      0,
                                      carouselMobileBannersRecordList.length -
                                          1)),
                              viewportFraction: 1.0,
                              disableCenter: true,
                              enlargeCenterPage: false,
                              enlargeFactor: 0.0,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 1400),
                              autoPlayInterval:
                                  Duration(milliseconds: (1400 + 4000)),
                              autoPlayCurve: Curves.linear,
                              pauseAutoPlayInFiniteScroll: true,
                              onPageChanged: (index, _) =>
                                  _model.carouselMobileCurrentIndex = index,
                            ),
                          ),
                        );
                      },
                    ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 80.0,
                            buttonSize: 40.0,
                            fillColor: Color(0x4BF5F5F5),
                            icon: Icon(
                              Icons.chevron_left,
                              color: FlutterFlowTheme.of(context).info,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'HOME_BANNER_COMP_chevron_left_ICN_ON_TAP');
                              await _model.carouselMobileController
                                  ?.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 20.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderRadius: 80.0,
                            buttonSize: 40.0,
                            fillColor: Color(0x4BF5F5F5),
                            icon: Icon(
                              Icons.navigate_next,
                              color: FlutterFlowTheme.of(context).info,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'HOME_BANNER_navigate_next_ICN_ON_TAP');
                              await _model.carouselMobileController?.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            },
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
    );
  }
}
