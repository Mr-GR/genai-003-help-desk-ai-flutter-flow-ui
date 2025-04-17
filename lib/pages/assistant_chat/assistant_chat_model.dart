import '/components/empty_conversation2/empty_conversation2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'assistant_chat_widget.dart' show AssistantChatWidget;
import 'package:flutter/material.dart';

class AssistantChatModel extends FlutterFlowModel<AssistantChatWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for EmptyConversation2 component.
  late EmptyConversation2Model emptyConversation2Model;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {
    emptyConversation2Model =
        createModel(context, () => EmptyConversation2Model());
  }

  @override
  void dispose() {
    emptyConversation2Model.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
