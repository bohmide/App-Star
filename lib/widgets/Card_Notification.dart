// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Card_Notification extends StatefulWidget {
  const Card_Notification(
      {super.key,
      required this.title,
      required this.description,
      required this.time});
  final String title;
  final String description;
  final Timestamp time;

  @override
  State<Card_Notification> createState() => _Card_NotificationState();
}

class _Card_NotificationState extends State<Card_Notification> {
  String AMPM(DateTime date) {
    if (date.hour > 12) {
      return " PM";
    } else {
      return " AM";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime _date = widget.time.toDate();

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black54),
      ),
      height: size.height / 6,
      width: size.width,
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 24),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Text(
                          widget.description,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          "${DateFormat('HH:mm').format(_date).toString()} ${AMPM(_date)}")),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
