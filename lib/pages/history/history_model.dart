import 'dart:convert';
import 'package:help_desk/services/chat_message_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '/config.dart';
import '/models/chat.dart';
import 'history_widget.dart' show HistoryWidget;
import 'package:flutter/material.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HistoryModel extends FlutterFlowModel<HistoryWidget> {
    List<ChatMessage> chatMessages = [];

  Future<void> fetchChatHistory() async {
    final fetchedChats = await ChatService.fetchUserChats();
    chatMessages = fetchedChats;
  }
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  List<ChatMessage> messages = [];

  Future<void> deleteChatMessage(int messageId) async {
    try {
      await ChatService.deleteChatMessage(messageId);
      // After deleting, fetch the updated chat history again
      await fetchChatHistory();
    } catch (e) {
      print('Failed to delete chat message: $e');
    }
  }

  @override
  void initState(BuildContext context) {
    // no more static history items needed!
  }

  @override
  void dispose() {
    // no more static models to dispose!
  }
}
