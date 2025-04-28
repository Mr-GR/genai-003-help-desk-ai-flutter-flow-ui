import 'dart:convert';
import 'dart:io';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:help_desk/components/custom_alert_dialog/custom_alert_dialog.dart';
import 'package:help_desk/pages/chat_detail/chat_detail_widget.dart';
import 'package:help_desk/services/voice_recorder_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/config.dart';
import 'package:http/http.dart' as http;

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  static String routeName = 'Chat';
  static String routePath = '/chat';

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final recorder = VoiceRecorderService();
  bool isRecording = false;
  bool isAwaitingResponse = false;

  List<Map<String, String>> messages = [];

  Future<void> sendMessage(String question) async {
    setState(() {
      messages.add({'role': 'user', 'text': question});
      isAwaitingResponse = true;
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
        body: jsonEncode({"question": question}),
      );

      final data = jsonDecode(response.body);
      final answer = data["answer"] ?? "Unexpected error";
      final shouldSuggest = data["suggest_ticket"] ?? false;

      setState(() {
        messages.add({'role': 'ai', 'text': answer});
        isAwaitingResponse = false;
      });

      if (shouldSuggest) {
        await Future.delayed(const Duration(seconds: 3));
        _promptSubmitTicket(question, answer);
      }
    } catch (e) {
      setState(() {
        messages.add({'role': 'ai', 'text': '⚠️ Network error: $e'});
        isAwaitingResponse = false;
      });
    }

    _controller.clear();
    await Future.delayed(const Duration(milliseconds: 200));
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<String?> transcribeVoice(File audioFile) async {
    final uri = Uri.parse('http://${Config.baseUrl}:8080/transcribe');
    final request = http.MultipartRequest('POST', uri)
      ..files.add(await http.MultipartFile.fromPath('file', audioFile.path));

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      return responseBody;
    } else {
      print("Transcription failed: $responseBody");
      return null;
    }
  }

  Widget _buildBubble(Map<String, String> message) {
    final isUser = message['role'] == 'user';
    final bgColor = FlutterFlowTheme.of(context).secondaryBackground;
    final textColor = Colors.white;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser)
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.asset(
                  'assets/images/Subtract_(3).png',
                  width: 20.0,
                  height: 20.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                message['text'] ?? '',
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

void _promptSubmitTicket(String question, String response) async {
  final confirm = await showConfirmationDialog(
    context,
    title: "Submit Ticket",
    content: "Would you like to submit this as a support ticket?",
    confirmText: "Submit",
  );

  if (confirm == true) {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    try {
      final response = await http.post(
        Uri.parse("http://${Config.baseUrl}:8080/tickets"),
        headers: {
          "Content-Type": "application/json",
          if (token != null) "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "user_ticket": question,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        showSuccessSnackBar(context, "✅ Ticket submitted successfully");
      } else {
        throw Exception('Failed to submit ticket');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Ticket submission failed: $e"))
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Stack(
          alignment: Alignment.center,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                context.pushNamed(ProPlansWidget.routeName);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Get Pro', style: FlutterFlowTheme.of(context).bodyMedium),
                    const SizedBox(width: 8),
                    Icon(Icons.auto_awesome_rounded,
                        color: FlutterFlowTheme.of(context).primary, size: 22),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () => context.pushNamed(HomeWidget.routeName),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image.asset(
                    'assets/images/Subtract_(3).png',
                    width: 25,
                    height: 25,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => scaffoldKey.currentState?.openDrawer(),
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    FFIcons.kmenu,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        child: SafeArea(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              final isUserMessage = message['role'] == 'user';

              if (!isUserMessage) return const SizedBox.shrink();

              return ListTile(
                leading: const Icon(Icons.chat_bubble_outline),
                title: Text(
                  message['text'] ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
                onTap: () {
                  final userMessage = message['text'] ?? '';
                  String aiResponse = '';
                  if (index + 1 < messages.length &&
                      messages[index + 1]['role'] == 'ai') {
                    aiResponse = messages[index + 1]['text'] ?? '';
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatDetailWidget(
                        userMessage: userMessage,
                        aiResponse: aiResponse,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                children: [
                  ...messages.map((m) => _buildBubble(m)).toList(),
                  if (isAwaitingResponse)
                    _buildBubble({'role': 'ai', 'text': 'Typing...'}),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (value) {
                        if (value.trim().isNotEmpty) {
                          sendMessage(value.trim());
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Ask me an IT question...',
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    icon: Icon(
                      FFIcons.kmicrophone11,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    onPressed: () async {
                      try {
                        if (!isRecording) {
                          await recorder.startRecording();
                          setState(() => isRecording = true);
                        } else {
                          final file = await recorder.stopRecording();
                          setState(() => isRecording = false);

                          if (file != null) {
                            final transcript = await transcribeVoice(file);
                            if (transcript != null) {
                              _controller.text = transcript;
                            }
                          }
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("🎙️ Please enable mic access."),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(width: 5),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).secondary,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {
                        final question = _controller.text.trim();
                        if (question.isNotEmpty) {
                          sendMessage(question);
                        }
                      },
                      borderRadius: BorderRadius.circular(100),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Icon(
                          FFIcons.ksend238,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
