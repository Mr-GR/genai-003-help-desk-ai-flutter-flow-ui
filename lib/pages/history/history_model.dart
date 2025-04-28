import 'package:help_desk/services/chat_message_service.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'history_widget.dart' show HistoryWidget;
import 'package:flutter/material.dart';

class HistoryModel extends FlutterFlowModel<HistoryWidget> {
  List<ChatMessage> chatMessages = [];

  // ✅ Fetch all chat messages
  Future<void> fetchChatHistory() async {
    chatMessages = await ChatService.fetchUserChats();
  }

  // ✅ Manage chip state (still optional)
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  // ✅ Delete a single chat message
  Future<void> deleteChatMessage(int messageId) async {
    try {
      await ChatService.deleteChatMessage(messageId);
      await fetchChatHistory(); // Refresh after deletion
    } catch (e) {
      print('Failed to delete chat message: $e');
    }
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
