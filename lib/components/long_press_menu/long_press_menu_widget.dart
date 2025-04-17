import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'long_press_menu_model.dart';
export 'long_press_menu_model.dart';

class LongPressMenuWidget extends StatefulWidget {
  const LongPressMenuWidget({super.key});

  @override
  State<LongPressMenuWidget> createState() => _LongPressMenuWidgetState();
}

class _LongPressMenuWidgetState extends State<LongPressMenuWidget> {
  late LongPressMenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LongPressMenuModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  FFIcons.kcopy05,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Text(
                  'Copy',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(SizedBox(width: 15.0)),
            ),
          ),
          Divider(
            height: 1.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  FFIcons.kclipboardText10,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Text(
                  'Select text',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(SizedBox(width: 15.0)),
            ),
          ),
          Divider(
            height: 1.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  FFIcons.klike,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Text(
                  'Good Response',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(SizedBox(width: 15.0)),
            ),
          ),
          Divider(
            height: 1.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  FFIcons.kdislike,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Text(
                  'Bad Response',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(SizedBox(width: 15.0)),
            ),
          ),
          Divider(
            height: 1.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.graphic_eq_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Text(
                  'Read loud',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(SizedBox(width: 15.0)),
            ),
          ),
          Divider(
            height: 1.0,
            color: FlutterFlowTheme.of(context).alternate,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  FFIcons.krefresh1,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                Text(
                  'Regenerate',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ].divide(SizedBox(width: 15.0)),
            ),
          ),
        ]
            .divide(SizedBox(height: 15.0))
            .addToStart(SizedBox(height: 20.0))
            .addToEnd(SizedBox(height: 20.0)),
      ),
    );
  }
}
