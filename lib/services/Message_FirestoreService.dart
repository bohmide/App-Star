// ignore_for_file: camel_case_types, file_names

import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/Message.dart';

class Message_FirestoreService {
  final CollectionReference messageCollection =
      FirebaseFirestore.instance.collection("message");

  Future<void> sendMessage(
      String senderId, String receiverId, String content, DateTime timestamp) {
    return messageCollection.add(Message(
        id: messageCollection.doc().id,
        senderId: senderId,
        receiverId: receiverId,
        content: content,
        timestamp: timestamp));
  }

  Stream<List<Message>> getMessage(String senderId) {
    return messageCollection
        .where('SenderId', isEqualTo: senderId)
        .orderBy('Timestamp', descending: true)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Message.fromFirestore(doc)).toList());
  }
}
