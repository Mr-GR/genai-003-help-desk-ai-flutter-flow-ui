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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssistantsModel());
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
            mainAxisSize: MainAxisSize.max,
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
                'AI Assistants',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Urbanist',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                  child: FlutterFlowChoiceChips(
                    options: [
                      ChipData('All'),
                      ChipData('Writing '),
                      ChipData('Creative'),
                      ChipData('Business'),
                      ChipData('Social Media'),
                      ChipData('Developer'),
                      ChipData('Personal'),
                      ChipData('Others')
                    ],
                    onChanged: (val) => safeSetState(
                        () => _model.choiceChipsValue = val?.firstOrNull),
                    selectedChipStyle: ChipStyle(
                      backgroundColor: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Urbanist',
                                color: FlutterFlowTheme.of(context).info,
                                letterSpacing: 0.0,
                              ),
                      iconColor: FlutterFlowTheme.of(context).info,
                      iconSize: 16.0,
                      labelPadding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 7.0, 15.0, 7.0),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    unselectedChipStyle: ChipStyle(
                      backgroundColor: Color(0x00000000),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Urbanist',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                              ),
                      iconColor: FlutterFlowTheme.of(context).secondaryText,
                      iconSize: 16.0,
                      labelPadding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 7.0, 15.0, 7.0),
                      elevation: 0.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    chipSpacing: 8.0,
                    rowSpacing: 8.0,
                    multiselect: false,
                    alignment: WrapAlignment.start,
                    controller: _model.choiceChipsValueController ??=
                        FormFieldController<List<String>>(
                      [],
                    ),
                    wrapped: false,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Writing',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.assistantItemModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '📝',
                              title: 'Write Articles',
                              color: Color(0xFF09CC6B),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '🎓',
                              title: 'Academic writer',
                              color: Color(0xFF1A96F0),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '📄',
                              title: 'Summarize',
                              color: Color(0xFFF54336),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel4,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '🌍',
                              title: 'Translate',
                              color: Color(0xFFFF981F),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel5,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '🔍',
                              title: 'Checker',
                              color: Color(0xFF9D28AC),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 10.0))
                            .addToStart(SizedBox(width: 20.0))
                            .addToEnd(SizedBox(width: 20.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Creative',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.assistantItemModel6,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '🎶',
                              title: 'Song Lyrics',
                              color: Color(0xFFFFC02D),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel7,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '📖',
                              title: 'Story teller',
                              color: Color(0xFF00BCD3),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel8,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '📜',
                              title: 'Poems',
                              color: Color(0xFFF54336),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel9,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '🎬',
                              title: 'Movie Script',
                              color: Color(0xFFFF981F),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 10.0))
                            .addToStart(SizedBox(width: 20.0))
                            .addToEnd(SizedBox(width: 20.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Business',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.assistantItemModel10,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '✉️',
                              title: 'Email Composer',
                              color: Color(0xFF7A5548),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel11,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '📃',
                              title: 'Answer Interview',
                              color: Color(0xFF607D8A),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel12,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '💼',
                              title: 'Job Post',
                              color: Color(0xFFEA1E61),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel13,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '🌟',
                              title: 'Advertisments',
                              color: Color(0xFFFF5726),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 10.0))
                            .addToStart(SizedBox(width: 20.0))
                            .addToEnd(SizedBox(width: 20.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Developer',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.assistantItemModel14,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '💻',
                              title: 'Write Code',
                              color: Color(0xFF4AAF57),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel15,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '🧩',
                              title: 'Explain Code',
                              color: Color(0xFF607D8A),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 10.0))
                            .addToStart(SizedBox(width: 20.0))
                            .addToEnd(SizedBox(width: 20.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Personal',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.assistantItemModel16,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '🎂',
                              title: 'Birthday',
                              color: Color(0xFFFFC02D),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel17,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '🧧',
                              title: 'Apology',
                              color: Color(0xFFCDDC4C),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel18,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '📩',
                              title: 'Invitation',
                              color: Color(0xFF00A9F1),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 10.0))
                            .addToStart(SizedBox(width: 20.0))
                            .addToEnd(SizedBox(width: 20.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Other',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.assistantItemModel19,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '💬',
                              title: 'Conversation',
                              color: Color(0xFF9D28AC),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel20,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '😂',
                              title: 'Tell a joke',
                              color: Color(0xFF607D8A),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel21,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '📩',
                              title: 'Food recipes',
                              color: Color(0xFFF54336),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.assistantItemModel22,
                            updateCallback: () => safeSetState(() {}),
                            child: AssistantItemWidget(
                              emoji: '🥗',
                              title: 'Diet Plan',
                              color: Color(0xFF8BC255),
                            ),
                          ),
                        ]
                            .divide(SizedBox(width: 10.0))
                            .addToStart(SizedBox(width: 20.0))
                            .addToEnd(SizedBox(width: 20.0)),
                      ),
                    ),
                  ].divide(SizedBox(height: 20.0)),
                ),
              ]
                  .divide(SizedBox(height: 20.0))
                  .addToStart(SizedBox(height: 10.0))
                  .addToEnd(SizedBox(height: 50.0)),
            ),
          ),
        ),
      ),
    );
  }
}
