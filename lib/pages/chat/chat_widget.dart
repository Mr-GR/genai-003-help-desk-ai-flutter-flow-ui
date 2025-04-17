import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/config.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  static String routeName = 'Chat';
  static String routePath = '/chat';

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<Map<String, String>> messages = [];

  Future<void> sendMessage(String question) async {
    setState(() {
      messages.add({'role': 'user', 'text': question});
    });

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');
    final url = Uri.parse('http://${Config.baseUrl}:8080/ask');

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          if (token != null) "Authorization": "Bearer $token",
        },
        body: jsonEncode({'question': question}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final answer = responseData['answer'];
        setState(() {
          messages.add({'role': 'ai', 'text': answer});
        });
      } else {
        throw Exception('Failed to get response: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        messages.add({'role': 'ai', 'text': '⚠️ Error: ${e.toString()}'});
      });
    }

    _controller.clear();

    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  Widget _buildBubble(Map<String, String> message) {
    final isUser = message['role'] == 'user';
    final bubbleColor = isUser
        ? FlutterFlowTheme.of(context).primary
        : FlutterFlowTheme.of(context).secondaryBackground;
    final textColor = isUser ? Colors.white : Colors.white;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          message['text'] ?? '',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Urbanist',
                color: textColor,
                fontSize: 16,
              ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        title: const Text("Chat with AI"),
        backgroundColor: FlutterFlowTheme.of(context).primary,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: messages.length,
                itemBuilder: (context, index) => _buildBubble(messages[index]),
              ),
            ),
            Container(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (value) {
                        if (value.trim().isNotEmpty) sendMessage(value.trim());
                      },
                      decoration: InputDecoration(
                        hintText: 'Ask me anything...',
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send),
                    color: FlutterFlowTheme.of(context).primary,
                    onPressed: () {
                      final question = _controller.text.trim();
                      if (question.isNotEmpty) sendMessage(question);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
