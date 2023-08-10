// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../discussion_Page.dart';

class Messanger extends StatefulWidget {
  const Messanger({
    super.key,
  });

  @override
  State<Messanger> createState() => _MessangerState();
}

class _MessangerState extends State<Messanger> {
  int seen = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Flexible(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: _list(context)),
        ),
      ],
    ));
  }

  Widget _list(context) {
    final List<String> myList = List.generate(100, (index) => 'client $index');
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      ),
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: myList.length,
          // The list items
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, top: 16, right: 20),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    seen = 1;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const discussion_Page())));
                },
                child: MessageNotif(
                    message: "rahou jek message",
                    user: "si  foulen",
                    time: DateTime.now(),
                    isSeen: seen),
              ),
            );
          },
          // The separators
          separatorBuilder: (context, index) {
            return const Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.black54,
            );
          }),
    );
  }
}

class MessageNotif extends StatelessWidget {
  final String message;
  final String user;
  final DateTime time;
  final int isSeen;
  const MessageNotif(
      {super.key,
      required this.message,
      required this.user,
      required this.time,
      required this.isSeen});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            height: 60,
            width: 60,
            child: const Icon(
              Icons.account_circle,
              size: 60,
              color: Colors.grey,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    user,
                    style: const TextStyle(fontSize: 24),
                  ),
                  if (isSeen == 0)
                    Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: MediaQuery.of(context).size.height * 0.02,
                    )
                ],
              ),
              Text(
                "$message ${DateFormat('HH:mm').format(DateTime.now())}",
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        )
      ],
    );
  }
}
