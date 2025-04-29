import 'package:help_desk/components/history_item/history_item_widget.dart';
import 'package:help_desk/pages/ticket_detail/ticket_detail_widget.dart';
import '/components/assistant_item/assistant_item_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'assistants_model.dart';
export 'assistants_model.dart';

class AssistantsWidget extends StatefulWidget {
  const AssistantsWidget({super.key});

  static String routeName = 'Assistants';
  static String routePath = '/assistants';

  @override
  State<AssistantsWidget> createState() => _AssistantsWidgetState();
}

class _AssistantsWidgetState extends State<AssistantsWidget> {
  late AssistantsModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssistantsModel());
    Future.microtask(() async {
      try {
        await _model.fetchTickets();
      } catch (e) {
        print('Failed to fetch tickets: $e');
      } finally {
        setState(() => isLoading = false);
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
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
                  width: 30.0,
                  height: 30.0,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                'Submitted Tickets',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Urbanist',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Container(), 
            ],
          ),
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 0.0),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _model.tickets.isEmpty
                        ? Center(
                            child: Text(
                              'No tickets submitted yet.',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            itemCount: _model.tickets.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              final ticket = _model.tickets[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TicketDetailWidget(ticket: ticket),
                                    ),
                                  );
                                },
                                child: HistoryItemWidget(
                                  emoji: '📩',
                                  title: (ticket.title?.isNotEmpty ?? false)
                                      ? ticket.title
                                      : (ticket.userTicket?.isNotEmpty ?? false)
                                          ? ticket.userTicket!
                                          : 'No Title',
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
