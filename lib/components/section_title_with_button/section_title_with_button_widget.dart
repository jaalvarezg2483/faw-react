import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'section_title_with_button_model.dart';
export 'section_title_with_button_model.dart';

class SectionTitleWithButtonWidget extends StatefulWidget {
  const SectionTitleWithButtonWidget({
    super.key,
    String? icon,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.buttonText,
    required this.buttonAction,
  }) : this.icon = icon ??
            'https://storage.googleapis.com/flutterflow-enterprise-usc.appspot.com/projects/web-faw-pcp5lv/assets/pue42k8o230y/bank.png';

  final String icon;
  final String? title;
  final String? subtitle;
  final String? content;
  final String? buttonText;
  final Future Function()? buttonAction;

  @override
  State<SectionTitleWithButtonWidget> createState() =>
      _SectionTitleWithButtonWidgetState();
}

class _SectionTitleWithButtonWidgetState
    extends State<SectionTitleWithButtonWidget> {
  late SectionTitleWithButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SectionTitleWithButtonModel());

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
      width: MediaQuery.sizeOf(context).width * 1.0,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              valueOrDefault<String>(
                widget!.icon,
                'https://storage.googleapis.com/flutterflow-enterprise-usc.appspot.com/projects/web-faw-pcp5lv/assets/pue42k8o230y/bank.png',
              ),
              width: 48.0,
              height: 48.0,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            widget!.title!,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 34.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          Text(
            widget!.subtitle!,
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primary,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
              child: Text(
                widget!.content!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Flexible(
            child: Container(
              width: 262.0,
              height: 50.0,
              decoration: BoxDecoration(),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('SECTION_TITLE_WITH_BUTTON_Button_wcttr5w');
                  await widget.buttonAction?.call();
                },
                text: valueOrDefault<String>(
                  widget!.buttonText,
                  'Calcular',
                ),
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0x00F1F4F8),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 22.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 3.0,
                  ),
                  borderRadius: BorderRadius.circular(35.0),
                ),
              ),
            ),
          ),
        ].divide(SizedBox(height: 10.0)).addToEnd(SizedBox(height: 40.0)),
      ),
    );
  }
}
