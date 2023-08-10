import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String id;
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime timestamp;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timestamp,
  });

  factory Message.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Message(
      id: doc.id,
      senderId: data['senderId'],
      receiverId: data['receiverId'],
      content: data['content'],
      timestamp: data['timestamp'].toDate(),
    );
  }
}
