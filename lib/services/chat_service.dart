import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/chat_message.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Send a message
  Future<void> sendMessage(ChatMessage message) async {
    await _firestore.collection('chats').add(message.toMap());
  }

  // Get a stream of messages
  Stream<QuerySnapshot> getMessages() {
    return _firestore.collection('chats').orderBy('timestamp').snapshots();
  }
}