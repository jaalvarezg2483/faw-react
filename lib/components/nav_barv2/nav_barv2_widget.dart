import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_barv2_model.dart';
export 'nav_barv2_model.dart';

class NavBarv2Widget extends StatefulWidget {
  const NavBarv2Widget({super.key});

  @override
  State<NavBarv2Widget> createState() => _NavBarv2WidgetState();
}

class _NavBarv2WidgetState extends State<NavBarv2Widget> {
  late NavBarv2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarv2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 40.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('NAV_BARV2_COMP_Image_1pq5jeli_ON_TAP');

                  context.pushNamed(HomeWidget.routeName);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Vector.png',
                    height: 34.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            FlutterFlowWebView(
              content:
                  '<!-- Google Tag Manager (noscript) -->\n\n<noscript><iframe src=https://www.googletagmanager.com/ns.html?id=GTM-WSRVH3LK\n\nheight=\"0\" width=\"0\" style=\"display:none;visibility:hidden\"></iframe></noscript>\n\n<!-- End Google Tag Manager (noscript) -->',
              width: 0.0,
              height: 0.0,
              verticalScroll: false,
              horizontalScroll: false,
              html: true,
            ),
            StreamBuilder<List<NavBarRecord>>(
              stream: queryNavBarRecord(
                queryBuilder: (navBarRecord) => navBarRecord
                    .where(
                      'isActive',
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
                List<NavBarRecord> rowNavBarRecordList = snapshot.data!;

                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children:
                      List.generate(rowNavBarRecordList.length, (rowIndex) {
                    final rowNavBarRecord = rowNavBarRecordList[rowIndex];
                    return FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('NAV_BARV2_COMP_INICIO_BTN_ON_TAP');
                        if (rowNavBarRecord.isLink) {
                          await launchURL(rowNavBarRecord.urlPage);
                        } else {
                          await actions.navigateToPage(
                            context,
                            rowNavBarRecord.page,
                          );
                        }
                      },
                      text: rowNavBarRecord.name,
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: rowNavBarRecord.name ==
                                          FFAppState().menuOptionActive
                                      ? FlutterFlowTheme.of(context).secondary
                                      : FlutterFlowTheme.of(context).primary,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                        hoverTextColor: FlutterFlowTheme.of(context).primary,
                      ),
                    );
                  })
                          .divide(SizedBox(width: 48.0))
                          .addToStart(SizedBox(width: 13.0))
                          .addToEnd(SizedBox(width: 39.0)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
