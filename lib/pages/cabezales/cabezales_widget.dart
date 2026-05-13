import '/components/nav_bar_mobv2/nav_bar_mobv2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cabezales_model.dart';
export 'cabezales_model.dart';

class CabezalesWidget extends StatefulWidget {
  const CabezalesWidget({super.key});

  static String routeName = 'Cabezales';
  static String routePath = '/cabezales';

  @override
  State<CabezalesWidget> createState() => _CabezalesWidgetState();
}

class _CabezalesWidgetState extends State<CabezalesWidget> {
  late CabezalesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CabezalesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Cabezales'});
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
              Expanded(
                child: wrapWithModel(
                  model: _model.navBarMobv2Model,
                  updateCallback: () => safeSetState(() {}),
                  child: NavBarMobv2Widget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
