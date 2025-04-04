import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
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
                  context.pushNamed(
                    HomeWidget.routeName,
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 0),
                      ),
                    },
                  );

                  FFAppState().models = [];
                  safeSetState(() {});
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/FAW-VerticalBlanco_(2).png',
                    width: 100.0,
                    height: 80.0,
                    fit: BoxFit.cover,
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
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (rowNavBarRecord.isLink) {
                          await launchURL(rowNavBarRecord.urlPage);
                        } else {
                          await actions.navigateToPage(
                            context,
                            rowNavBarRecord.page,
                          );
                        }

                        FFAppState().isModelSelected = false;
                        FFAppState().modelSelected = '';
                        FFAppState().models = [];
                        safeSetState(() {});
                      },
                      child: Text(
                        rowNavBarRecord.name,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                            ),
                      ),
                    );
                  })
                          .divide(SizedBox(width: 15.0))
                          .addToStart(SizedBox(width: 13.0))
                          .addToEnd(SizedBox(width: 13.0)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
