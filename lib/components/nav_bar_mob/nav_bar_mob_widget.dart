import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nav_bar_mob_model.dart';
export 'nav_bar_mob_model.dart';

class NavBarMobWidget extends StatefulWidget {
  const NavBarMobWidget({super.key});

  @override
  State<NavBarMobWidget> createState() => _NavBarMobWidgetState();
}

class _NavBarMobWidgetState extends State<NavBarMobWidget> {
  late NavBarMobModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarMobModel());

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
        Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.1,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primary,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('Home');
                  },
                  child: Container(
                    decoration: BoxDecoration(),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'Home',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );

                        FFAppState().isModelSelected = false;
                        FFAppState().modelSelected = '';
                        safeSetState(() {});
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/FAW-VerticalBlanco_(2).png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.menu,
                    color: FlutterFlowTheme.of(context).info,
                    size: 28.0,
                  ),
                  onPressed: () async {
                    FFAppState().isMenuMobile =
                        !(FFAppState().isMenuMobile ?? true);
                    FFAppState().update(() {});
                    _model.isMenuActive = !_model.isMenuActive;
                    _model.updatePage(() {});
                  },
                ),
              ],
            ),
          ),
        ),
        if (_model.isMenuActive)
          Flexible(
            child: StreamBuilder<List<NavBarRecord>>(
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
                List<NavBarRecord> containerNavBarRecordList = snapshot.data!;

                return Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(40.0, 40.0, 40.0, 40.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final containerVar =
                                  containerNavBarRecordList.toList();

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(containerVar.length,
                                    (containerVarIndex) {
                                  final containerVarItem =
                                      containerVar[containerVarIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if (containerVarItem.isLink) {
                                        await launchURL(
                                            containerVarItem.urlPage);
                                        FFAppState().isModelSelected = false;
                                        FFAppState().modelSelected = '';
                                        safeSetState(() {});
                                        return;
                                      } else {
                                        await actions.navigateToPage(
                                          context,
                                          containerVarItem.page,
                                        );
                                      }

                                      _model.isMenuActive =
                                          !_model.isMenuActive;
                                      safeSetState(() {});
                                      FFAppState().isMenuMobile =
                                          !(FFAppState().isMenuMobile ?? true);
                                      safeSetState(() {});
                                      FFAppState().isModelSelected = false;
                                      FFAppState().modelSelected = '';
                                      safeSetState(() {});
                                    },
                                    child: Text(
                                      containerVarItem.name,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  );
                                }).divide(SizedBox(height: 25.0)),
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 70.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchURL(
                                      'https://www.facebook.com/share/orQ9LgyG8Ejs6nqj/?mibextid=JRoKGi');
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.facebookSquare,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchURL(
                                      'https://www.instagram.com/fawtruckscostarica/profilecard/?igsh=OWx2MGtmcnE4MGE1');
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await launchURL(
                                      'https://www.linkedin.com/company/faw-trucks-costa-rica/');
                                },
                                child: FaIcon(
                                  FontAwesomeIcons.linkedinIn,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ].divide(SizedBox(width: 10.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
