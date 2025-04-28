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
