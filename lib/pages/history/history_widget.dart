import 'package:help_desk/pages/search/search_widget.dart';
import '/components/history_item/history_item_widget.dart';
import '/components/confirm_clear_history/confirm_clear_history_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'history_model.dart';
import '/services/chat_message_service.dart';
export 'history_model.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({super.key});

  static String routeName = 'History';
  static String routePath = '/history';

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  late HistoryModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryModel());
    Future.microtask(() async {
      try {
        await _model.fetchChatHistory();
      } catch (e) {
        print('Failed to fetch chat history: $e');
      }
      setState(() => isLoading = false);
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _deleteMessage(int messageId) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        title: const Text('Delete Chat?'),
        content: const Text('Are you sure you want to delete this chat history?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context, false),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              foregroundColor: FlutterFlowTheme.of(context).info,
            ),
            child: const Text('Delete'),
            onPressed: () => Navigator.pop(context, true),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await ChatService.deleteChatMessage(messageId);
        await _model.fetchChatHistory();
        setState(() {}); // Refresh list
      } catch (e) {
        print('Failed to delete chat: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Subtract_(3).png',
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                'History',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Urbanist',
                      fontSize: 20,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      FFIcons.ksearchNormal01,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24,
                    ),
                    onPressed: () {
                      context.pushNamed(SearchWidget.routeName);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      FFIcons.kdelete2,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24,
                    ),
                    onPressed: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        useSafeArea: true,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => FocusScope.of(context).unfocus(),
                            child: const ConfirmClearHistoryWidget(),
                          );
                        },
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : _model.chatMessages.isEmpty
                  ? Center(
                      child: Text(
                        'No chat history yet.',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(20),
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemCount: _model.chatMessages.length,
                      itemBuilder: (context, index) {
                        final message = _model.chatMessages[index];
                        return GestureDetector(
                          onLongPress: () => _deleteMessage(message.id),
                          child: HistoryItemWidget(
                            emoji: '💬',
                            title: message.message.length > 60
                                ? '${message.message.substring(0, 60)}...'
                                : message.message,
                            color: FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
