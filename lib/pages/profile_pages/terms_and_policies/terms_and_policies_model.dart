import '/components/back_btn/back_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'terms_and_policies_widget.dart' show TermsAndPoliciesWidget;
import 'package:flutter/material.dart';

class TermsAndPoliciesModel extends FlutterFlowModel<TermsAndPoliciesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackBtn component.
  late BackBtnModel backBtnModel;

  @override
  void initState(BuildContext context) {
    backBtnModel = createModel(context, () => BackBtnModel());
  }

  @override
  void dispose() {
    backBtnModel.dispose();
  }
}
