import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'success_dialog_model.dart';
export 'success_dialog_model.dart';

class SuccessDialogWidget extends StatefulWidget {
  const SuccessDialogWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.desc,
    required this.doneText,
    required this.doneAction,
  });

  final Widget? icon;
  final String? title;
  final String? desc;
  final String? doneText;
  final Future Function()? doneAction;

  @override
  State<SuccessDialogWidget> createState() => _SuccessDialogWidgetState();
}

class _SuccessDialogWidgetState extends State<SuccessDialogWidget> {
  late SuccessDialogModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuccessDialogModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        FlutterFlowTheme.of(context).primary,
                        FlutterFlowTheme.of(context).secondary
                      ],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(1.0, 0.0),
                      end: AlignmentDirectional(-1.0, 0),
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: widget.icon!,
                  ),
                ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.title,
                  'Title',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Urbanist',
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Text(
                valueOrDefault<String>(
                  widget.desc,
                  'Desc',
                ),
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Urbanist',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  await widget.doneAction?.call();
                },
                text: widget.doneText!,
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Urbanist',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ].divide(SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
