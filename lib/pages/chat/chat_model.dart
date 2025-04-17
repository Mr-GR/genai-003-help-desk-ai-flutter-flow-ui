import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Stores action output result for [Backend Call - API (CreateTicket)] action in TextField widget.
  ApiCallResponse? apiResult1;
  // Stores action output result for [Backend Call - API (CreateTicket)] action in Icon widget.
  ApiCallResponse? apiResultSubmit;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
  }

  @override
  void dispose() {
    columnController1?.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    columnController2?.dispose();
    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
