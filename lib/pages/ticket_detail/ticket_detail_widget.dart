import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/config.dart';
import 'package:flutter/material.dart';
import 'package:help_desk/models/tickets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TicketDetailWidget extends StatelessWidget {
  final Ticket ticket;

  const TicketDetailWidget({super.key, required this.ticket});

  Future<void> _deleteTicket(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Delete Ticket',
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Urbanist',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Are you sure you want to delete this ticket?',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FFButtonWidget(
                      onPressed: () => Navigator.pop(context, false),
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: 120,
                        height: 40,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () => Navigator.pop(context, true),
                      text: 'Delete',
                      options: FFButtonOptions(
                        width: 120,
                        height: 40,
                        color: FlutterFlowTheme.of(context).error,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Urbanist',
                              color: Colors.white,
                            ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    if (confirm == true) {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('access_token');

      final response = await http.delete(
        Uri.parse('http://${Config.baseUrl}:8080/tickets/${ticket.id}'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 204) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '✅ Ticket deleted successfully!',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Urbanist',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
            ),
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '❌ Failed to delete ticket.',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Urbanist',
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
            ),
            backgroundColor: FlutterFlowTheme.of(context).error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Ticket Details',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Urbanist',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _deleteTicket(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Question:',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Urbanist',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              ticket.userTicket,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Urbanist',
                    fontSize: 16,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              'Admin Response:',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Urbanist',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              ticket.agentResponse ?? 'Pending...',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Urbanist',
                    fontSize: 16,
                  ),
            ),
            const Spacer(),
            Center(
              child: Text(
                'Created: ${dateTimeFormat('yMMMd', ticket.createdAt)}',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Urbanist',
                      fontSize: 14,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
