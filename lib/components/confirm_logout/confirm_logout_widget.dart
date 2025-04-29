import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

export 'confirm_logout_model.dart';

class ConfirmLogoutWidget extends StatefulWidget {
  const ConfirmLogoutWidget({super.key});

  @override
  State<ConfirmLogoutWidget> createState() => _ConfirmLogoutWidgetState();
}

class _ConfirmLogoutWidgetState extends State<ConfirmLogoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 0.5,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional(0.0, -1.0),
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
            child: Container(
              width: 45.0,
              height: 3.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).alternate,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20.0, 30.0, 20.0, 30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Log Out',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).error,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Divider(
                    height: 1.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Are you sure you want to logout?',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Urbanist',
                          fontSize: 16.0,
                          lineHeight: 1.5,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () {
                            Navigator.pop(context, false); // Cancel
                          },
                          text: 'Cancel',
                          options: FFButtonOptions(
                            height: 55.0,
                            color: FlutterFlowTheme.of(context).alternate,
                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Urbanist',
                                  color: FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () {
                            debugPrint('✅ Logout Confirmed');
                            Navigator.pop(context, true); // Confirm
                          },
                          text: 'Yes, Logout',
                          options: FFButtonOptions(
                            height: 55.0,
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Urbanist',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 16.0,
                                ),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
