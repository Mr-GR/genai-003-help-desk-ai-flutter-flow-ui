import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '/config.dart';

class Ticket {
  final int id;
  final String userTicket;
  final String? agentResponse;
  final String? title;  
  final DateTime createdAt;

  Ticket({
    required this.id,
    required this.userTicket,
    this.agentResponse,
    this.title,
    required this.createdAt,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      userTicket: json['user_ticket'] ?? '',
      agentResponse: json['agent_response'],
      title: json['title'],   
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}


class TicketService {
  static Future<List<Ticket>> fetchTickets() async {
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
      return data.map((json) => Ticket.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load tickets');
    }
  }
}
