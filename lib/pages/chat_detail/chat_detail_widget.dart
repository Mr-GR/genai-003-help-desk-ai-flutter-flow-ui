import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class ChatDetailWidget extends StatelessWidget {
  final String userMessage;
  final String aiResponse;

  const ChatDetailWidget({
    super.key,
    required this.userMessage,
    required this.aiResponse,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Chat Details',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Urbanist',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // User Message
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  userMessage,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                      ),
                ),
              ),
            ),
            // AI Response
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: FlutterFlowTheme.of(context).alternate,
                    width: 0.5,
                  ),
                ),
                child: Text(
                  aiResponse.isNotEmpty
                      ? aiResponse
                      : "Ticket submitted.",
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
