import 'package:cloud_firestore/cloud_firestore.dart';

class Constat {
  String id_client;
  String id_Expert;
  List<String> image_Constat;
  List<String> image_vehicule;
  String etat;
  String choix_Expert_Auto;
  Timestamp timestamp;

  Constat(
      {required this.id_client,
      required this.id_Expert,
      required this.choix_Expert_Auto,
      required this.etat,
      required this.timestamp,
      required this.image_Constat,
      required this.image_vehicule});
}
