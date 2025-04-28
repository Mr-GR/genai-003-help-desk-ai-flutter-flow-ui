import 'package:flutter/material.dart';
import 'package:help_desk/flutter_flow/flutter_flow_theme.dart';

void showSuccessSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Urbanist',
              color: FlutterFlowTheme.of(context).primaryText,
            ),
      ),
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    ),
  );
}

void showErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Urbanist',
              color: FlutterFlowTheme.of(context).primaryText,
            ),
      ),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.all(16),
      duration: const Duration(seconds: 2),
    ),
  );
}

Future<bool?> showConfirmationDialog(BuildContext context, {
  required String title,
  required String content,
  String cancelText = "Cancel",
  String confirmText = "Confirm",
}) {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      title: Text(
        title,
        style: FlutterFlowTheme.of(context).titleMedium,
      ),
      content: Text(
        content,
        style: FlutterFlowTheme.of(context).bodyMedium,
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: FlutterFlowTheme.of(context).secondaryText,
          ),
          child: Text(cancelText),
          onPressed: () => Navigator.pop(context, false),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            foregroundColor: FlutterFlowTheme.of(context).info,
          ),
          child: Text(confirmText),
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    ),
  );
}
