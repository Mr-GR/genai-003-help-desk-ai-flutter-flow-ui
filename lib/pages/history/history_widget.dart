import '/components/confirm_clear_history/confirm_clear_history_widget.dart';
import '/components/history_item/history_item_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'history_model.dart';
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HistoryModel());
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
                'History',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Urbanist',
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(SearchWidget.routeName);
                    },
                    child: Icon(
                      FFIcons.ksearchNormal01,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        useSafeArea: true,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: ConfirmClearHistoryWidget(),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Icon(
                      FFIcons.kdelete2,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ].divide(SizedBox(width: 20.0)),
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Wrap(
                    spacing: 0.0,
                    runSpacing: 20.0,
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    direction: Axis.horizontal,
                    runAlignment: WrapAlignment.start,
                    verticalDirection: VerticalDirection.down,
                    clipBehavior: Clip.none,
                    children: [
                      wrapWithModel(
                        model: _model.historyItemModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '📝',
                          title:
                              'Aenean justo urna, faucibus sed maximus et, auctor a urna.',
                          color: Color(0xFF09CC6B),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.historyItemModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '🎓',
                          title:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                          color: Color(0xFF1A96F0),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.historyItemModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '📄',
                          title: 'Maecenas consequat et dui sit amet semper.',
                          color: Color(0xFFF54336),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.historyItemModel4,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '🌍',
                          title:
                              'In augue lacus, consectetur in lorem eu, volutpat ultricies',
                          color: Color(0xFFFF981F),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.historyItemModel5,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '🎶',
                          title:
                              'Donec augue ipsum, congue a posuere eu, facilisis sit amet mi.',
                          color: Color(0xFFFFC02D),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.historyItemModel6,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '💬',
                          title:
                              'Ut lobortis porttitor turpis vel faucibus. Pellentesque quis ex quis lectus',
                          color: Color(0xFF9D28AC),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.historyItemModel7,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '😂',
                          title:
                              'Duis placerat dui massa, vel imperdiet nisi iaculis et. Vivamus varius est',
                          color: Color(0xFF607D8A),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.historyItemModel8,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '✉️',
                          title:
                              'Cras suscipit mi non enim semper blandit. Etiam venenatis suscipit ultricies.',
                          color: Color(0xFF7A5548),
                        ),
                      ),
                    ],
                  ),
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
