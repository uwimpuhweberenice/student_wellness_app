class ChatMessage {
  final String text;
  final String userId;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.userId,
    required this.timestamp,
  });

  // Convert to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'userId': userId,
      'timestamp': timestamp,
    };
  }

  // Create from a Firestore document
  factory ChatMessage.fromMap(Map<String, dynamic> data) {
    return ChatMessage(
      text: data['text'],
      userId: data['userId'],
      timestamp: data['timestamp'].toDate(),
    );
  }
}