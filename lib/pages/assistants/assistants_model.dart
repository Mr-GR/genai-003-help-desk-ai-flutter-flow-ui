import 'package:help_desk/config.dart';
import '/components/assistant_item/assistant_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'assistants_widget.dart' show AssistantsWidget;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:help_desk/models/tickets.dart';

class AssistantsModel extends FlutterFlowModel<AssistantsWidget> {
  ///  State fields for stateful widgets in this page.

  // ChoiceChips
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  // Ticket list
  List<Ticket> tickets = [];

  Future<void> fetchTickets() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    final response = await http.get(
      Uri.parse('http://${Config.baseUrl}:8080/tickets'), 
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      tickets = data.map((json) => Ticket.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch tickets');
    }
  }

  // AssistantItem Models
  late AssistantItemModel assistantItemModel1;
  late AssistantItemModel assistantItemModel2;
  late AssistantItemModel assistantItemModel3;
  late AssistantItemModel assistantItemModel4;
  late AssistantItemModel assistantItemModel5;
  late AssistantItemModel assistantItemModel6;
  late AssistantItemModel assistantItemModel7;
  late AssistantItemModel assistantItemModel8;
  late AssistantItemModel assistantItemModel9;
  late AssistantItemModel assistantItemModel10;
  late AssistantItemModel assistantItemModel11;
  late AssistantItemModel assistantItemModel12;
  late AssistantItemModel assistantItemModel13;
  late AssistantItemModel assistantItemModel14;
  late AssistantItemModel assistantItemModel15;
  late AssistantItemModel assistantItemModel16;
  late AssistantItemModel assistantItemModel17;
  late AssistantItemModel assistantItemModel18;
  late AssistantItemModel assistantItemModel19;
  late AssistantItemModel assistantItemModel20;
  late AssistantItemModel assistantItemModel21;
  late AssistantItemModel assistantItemModel22;

  @override
  void initState(BuildContext context) {
    assistantItemModel1 = createModel(context, () => AssistantItemModel());
    assistantItemModel2 = createModel(context, () => AssistantItemModel());
    assistantItemModel3 = createModel(context, () => AssistantItemModel());
    assistantItemModel4 = createModel(context, () => AssistantItemModel());
    assistantItemModel5 = createModel(context, () => AssistantItemModel());
    assistantItemModel6 = createModel(context, () => AssistantItemModel());
    assistantItemModel7 = createModel(context, () => AssistantItemModel());
    assistantItemModel8 = createModel(context, () => AssistantItemModel());
    assistantItemModel9 = createModel(context, () => AssistantItemModel());
    assistantItemModel10 = createModel(context, () => AssistantItemModel());
    assistantItemModel11 = createModel(context, () => AssistantItemModel());
    assistantItemModel12 = createModel(context, () => AssistantItemModel());
    assistantItemModel13 = createModel(context, () => AssistantItemModel());
    assistantItemModel14 = createModel(context, () => AssistantItemModel());
    assistantItemModel15 = createModel(context, () => AssistantItemModel());
    assistantItemModel16 = createModel(context, () => AssistantItemModel());
    assistantItemModel17 = createModel(context, () => AssistantItemModel());
    assistantItemModel18 = createModel(context, () => AssistantItemModel());
    assistantItemModel19 = createModel(context, () => AssistantItemModel());
    assistantItemModel20 = createModel(context, () => AssistantItemModel());
    assistantItemModel21 = createModel(context, () => AssistantItemModel());
    assistantItemModel22 = createModel(context, () => AssistantItemModel());
  }

  @override
  void dispose() {
    assistantItemModel1.dispose();
    assistantItemModel2.dispose();
    assistantItemModel3.dispose();
    assistantItemModel4.dispose();
    assistantItemModel5.dispose();
    assistantItemModel6.dispose();
    assistantItemModel7.dispose();
    assistantItemModel8.dispose();
    assistantItemModel9.dispose();
    assistantItemModel10.dispose();
    assistantItemModel11.dispose();
    assistantItemModel12.dispose();
    assistantItemModel13.dispose();
    assistantItemModel14.dispose();
    assistantItemModel15.dispose();
    assistantItemModel16.dispose();
    assistantItemModel17.dispose();
    assistantItemModel18.dispose();
    assistantItemModel19.dispose();
    assistantItemModel20.dispose();
    assistantItemModel21.dispose();
    assistantItemModel22.dispose();
  }
}
