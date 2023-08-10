import 'package:cloud_firestore/cloud_firestore.dart';

class Notification {
  String id_Client;
  String title;
  Timestamp timestamp;

  Notification(
      {required this.id_Client, required this.title, required this.timestamp});
}
