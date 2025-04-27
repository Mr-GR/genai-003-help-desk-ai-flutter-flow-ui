import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'long_press_menu_model.dart';
export 'long_press_menu_model.dart';

class LongPressMenuWidget extends StatefulWidget {
  final Future<void> Function()? onDelete;

  const LongPressMenuWidget({super.key, this.onDelete});

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
      width: 250,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildMenuItem(
            icon: FFIcons.kcopy05,
            label: 'Copy',
          ),
          _divider(),
          _buildMenuItem(
            icon: FFIcons.kclipboardText10,
            label: 'Select text',
          ),
          _divider(),
          _buildMenuItem(
            icon: FFIcons.klike,
            label: 'Good Response',
          ),
          _divider(),
          _buildMenuItem(
            icon: FFIcons.kdislike,
            label: 'Bad Response',
          ),
          _divider(),
          _buildMenuItem(
            icon: Icons.graphic_eq_rounded,
            label: 'Read aloud',
          ),
          _divider(),
          _buildMenuItem(
            icon: FFIcons.krefresh1,
            label: 'Regenerate',
          ),
          _divider(),
          GestureDetector(
            onTap: () async {
              Navigator.pop(context); // Close menu
              if (widget.onDelete != null) {
                await widget.onDelete!(); // Perform deletion
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.delete_outline,
                    color: FlutterFlowTheme.of(context).error,
                    size: 24,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    'Delete Chat',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).error,
                          fontSize: 16,
                          letterSpacing: 0,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ]
            .divide(const SizedBox(height: 15))
            .addToStart(const SizedBox(height: 20))
            .addToEnd(const SizedBox(height: 20)),
      ),
    );
  }

  Widget _buildMenuItem({required IconData icon, required String label}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            icon,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24,
          ),
          const SizedBox(width: 15),
          Text(
            label,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Urbanist',
                  fontSize: 16,
                  letterSpacing: 0,
                ),
          ),
        ],
      ),
    );
  }

  Widget _divider() => Divider(
        height: 1,
        color: FlutterFlowTheme.of(context).alternate,
      );
}
