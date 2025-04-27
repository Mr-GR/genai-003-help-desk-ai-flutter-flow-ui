import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Ticket {
  final int id;
  final String ticket;
  final String? response;
  final DateTime createdAt;

  Ticket({
    required this.id,
    required this.ticket,
    this.response,
    required this.createdAt,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
    id: json['id'],
    ticket: json['ticket'],
    response: json['response'],
    createdAt: DateTime.parse(json['created_at']),
  );
}
