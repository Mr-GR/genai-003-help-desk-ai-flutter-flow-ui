import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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

    await Future.delayed(Duration(seconds: 2));

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          if (token != null) "Authorization": "Bearer $token",
        },
        body: jsonEncode({"question": question}),
      );

      if (response.statusCode == 200) {
        final answer = jsonDecode(response.body)["answer"];
        setState(() {
          messages.add({'role': 'ai', 'text': answer});
          isAwaitingResponse = false;
        });
      } else {
        setState(() {
          messages.add({
            'role': 'ai',
            'text': '❌ Error: ${response.statusCode} ${response.reasonPhrase ?? 'Unknown error'}'
          });
          isAwaitingResponse = false;
        });
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

  Widget _buildBubble(Map<String, String> message) {
    final isUser = message['role'] == 'user';
    final bgColor = isUser
        ? FlutterFlowTheme.of(context).secondaryBackground
        : FlutterFlowTheme.of(context).secondaryBackground;
    final textColor = isUser ? Colors.white : Colors.white;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Get Pro',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Urbanist',
                              letterSpacing: 0.0,
                            ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.auto_awesome_rounded,
                        color: FlutterFlowTheme.of(context).primary,
                        size: 22.0,
                      ),
                    ],
                  ),
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
                    width: 25.0,
                    height: 25.0,
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
                    size: 28.0,
                  ),
                ),
              ),
            ),
          ],
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                          child: AnimatedTextKit(
                            repeatForever: true,
                            isRepeatingAnimation: true,
                            animatedTexts: [
                              TyperAnimatedText('Typing...'),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              color: Colors.transparent,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      FFIcons.kattachment,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    onPressed: () {
                      // TODO: Add file picker logic
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (value) {
                        if (value.trim().isNotEmpty) {
                          sendMessage(value.trim());
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Ask me an IT question..',
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
                    onPressed: () {
                      // TODO: Add mic input logic
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
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          FFIcons.ksend238,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
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
