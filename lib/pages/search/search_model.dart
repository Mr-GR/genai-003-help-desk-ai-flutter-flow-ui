import '/components/back_btn/back_btn_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for BackBtn component.
  late BackBtnModel backBtnModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    backBtnModel = createModel(context, () => BackBtnModel());
  }

  @override
  void dispose() {
    backBtnModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
