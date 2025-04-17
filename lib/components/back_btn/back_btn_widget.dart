import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'back_btn_model.dart';
export 'back_btn_model.dart';

class BackBtnWidget extends StatefulWidget {
  const BackBtnWidget({super.key});

  @override
  State<BackBtnWidget> createState() => _BackBtnWidgetState();
}

class _BackBtnWidgetState extends State<BackBtnWidget> {
  late BackBtnModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BackBtnModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        context.safePop();
      },
      child: Icon(
        FFIcons.karrowLeft44,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 26.0,
      ),
    );
  }
}
