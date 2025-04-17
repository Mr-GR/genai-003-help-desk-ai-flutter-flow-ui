import '/components/back_btn/back_btn_widget.dart';
import '/components/history_item/history_item_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'search_results_model.dart';
export 'search_results_model.dart';

class SearchResultsWidget extends StatefulWidget {
  const SearchResultsWidget({super.key});

  static String routeName = 'SearchResults';
  static String routePath = '/searchResults';

  @override
  State<SearchResultsWidget> createState() => _SearchResultsWidgetState();
}

class _SearchResultsWidgetState extends State<SearchResultsWidget> {
  late SearchResultsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchResultsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.sizeOf(context).height * 0.09),
          child: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                wrapWithModel(
                  model: _model.backBtnModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BackBtnWidget(),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                autofocus: false,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Urbanist',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Search',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Urbanist',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(0.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  prefixIcon: Icon(
                                    FFIcons.ksearchNormal01,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 18.0,
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Urbanist',
                                      letterSpacing: 0.0,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 20.0)),
            ),
            actions: [],
            centerTitle: false,
            toolbarHeight: MediaQuery.sizeOf(context).height * 0.09,
            elevation: 0.0,
          ),
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
                          emoji: '🎓',
                          title:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                          color: Color(0xFF1A96F0),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.historyItemModel2,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '🎶',
                          title:
                              'Donec augue ipsum, congue a posuere eu, facilisis sit amet mi.',
                          color: Color(0xFFFFC02D),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.historyItemModel3,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '✉️',
                          title:
                              'Cras suscipit mi non enim semper blandit. Etiam venenatis suscipit ultricies.',
                          color: Color(0xFF7A5548),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.historyItemModel4,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '📄',
                          title: 'Maecenas consequat et dui sit amet semper.',
                          color: Color(0xFFF54336),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.historyItemModel5,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '📝',
                          title:
                              'Aenean justo urna, faucibus sed maximus et, auctor a urna.',
                          color: Color(0xFF09CC6B),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.historyItemModel6,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '🌍',
                          title:
                              'In augue lacus, consectetur in lorem eu, volutpat ultricies',
                          color: Color(0xFFFF981F),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.historyItemModel7,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '💬',
                          title:
                              'Ut lobortis porttitor turpis vel faucibus. Pellentesque quis ex quis lectus',
                          color: Color(0xFF9D28AC),
                        ),
                      ),
                      wrapWithModel(
                        model: _model.historyItemModel8,
                        updateCallback: () => safeSetState(() {}),
                        child: HistoryItemWidget(
                          emoji: '😂',
                          title:
                              'Duis placerat dui massa, vel imperdiet nisi iaculis et. Vivamus varius est',
                          color: Color(0xFF607D8A),
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
