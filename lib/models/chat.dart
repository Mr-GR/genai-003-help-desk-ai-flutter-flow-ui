import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ChatMessage {
  final int id;
  final String message;
  final DateTime createdAt;

  ChatMessage({
    required this.id,
    required this.message,
    required this.createdAt,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        id: json['id'],
        message: json['content'],
        createdAt: DateTime.parse(json['created_at']),
      );
}
