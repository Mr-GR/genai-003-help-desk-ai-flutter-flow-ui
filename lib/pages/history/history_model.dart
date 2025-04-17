import '/components/history_item/history_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'history_widget.dart' show HistoryWidget;
import 'package:flutter/material.dart';

class HistoryModel extends FlutterFlowModel<HistoryWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Model for HistoryItem component.
  late HistoryItemModel historyItemModel1;
  // Model for HistoryItem component.
  late HistoryItemModel historyItemModel2;
  // Model for HistoryItem component.
  late HistoryItemModel historyItemModel3;
  // Model for HistoryItem component.
  late HistoryItemModel historyItemModel4;
  // Model for HistoryItem component.
  late HistoryItemModel historyItemModel5;
  // Model for HistoryItem component.
  late HistoryItemModel historyItemModel6;
  // Model for HistoryItem component.
  late HistoryItemModel historyItemModel7;
  // Model for HistoryItem component.
  late HistoryItemModel historyItemModel8;

  @override
  void initState(BuildContext context) {
    historyItemModel1 = createModel(context, () => HistoryItemModel());
    historyItemModel2 = createModel(context, () => HistoryItemModel());
    historyItemModel3 = createModel(context, () => HistoryItemModel());
    historyItemModel4 = createModel(context, () => HistoryItemModel());
    historyItemModel5 = createModel(context, () => HistoryItemModel());
    historyItemModel6 = createModel(context, () => HistoryItemModel());
    historyItemModel7 = createModel(context, () => HistoryItemModel());
    historyItemModel8 = createModel(context, () => HistoryItemModel());
  }

  @override
  void dispose() {
    historyItemModel1.dispose();
    historyItemModel2.dispose();
    historyItemModel3.dispose();
    historyItemModel4.dispose();
    historyItemModel5.dispose();
    historyItemModel6.dispose();
    historyItemModel7.dispose();
    historyItemModel8.dispose();
  }
}
