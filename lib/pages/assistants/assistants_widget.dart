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
              Container(), // Empty placeholder
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
                child: FlutterFlowChoiceChips(
                  options: [ChipData('All')],
                  onChanged: (val) => setState(() {
                    _model.choiceChipsValue = val?.firstOrNull;
                  }),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).info,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).info,
                    iconSize: 16.0,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: Colors.transparent,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 16.0,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
                    borderColor: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  chipSpacing: 8.0,
                  rowSpacing: 8.0,
                  multiselect: false,
                  alignment: WrapAlignment.start,
                  controller: _model.choiceChipsValueController ??=
                      FormFieldController<List<String>>([]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tickets',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Urbanist',
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Icon(
                      FFIcons.kright1,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                  ],
                ),
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
                              return AssistantItemWidget(
                                emoji: '📩',
                                title: ticket.ticket,
                                color: FlutterFlowTheme.of(context).secondaryBackground,
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
