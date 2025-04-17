import '/components/back_btn/back_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'security_widget.dart' show SecurityWidget;
import 'package:flutter/material.dart';

class SecurityModel extends FlutterFlowModel<SecurityWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackBtn component.
  late BackBtnModel backBtnModel;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // State field(s) for Switch widget.
  bool? switchValue4;

  @override
  void initState(BuildContext context) {
    backBtnModel = createModel(context, () => BackBtnModel());
  }

  @override
  void dispose() {
    backBtnModel.dispose();
  }
}
