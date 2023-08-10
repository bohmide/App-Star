// ignore_for_file: non_constant_identifier_names, file_names, unnecessary_import

import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size(MediaQuery.of(context).size.width, size.height * 0.05),
        child: Row(children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          const Text("Back")
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        child: _ListNotification(),
      ),
    ));
  }

  Widget _ListNotification() {
    final List<String> myList =
        List.generate(100, (index) => 'Notification $index');
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
          itemCount: myList.length,
          // The list items
          itemBuilder: (context, index) {
            return Text(
              myList[index],
              style: const TextStyle(fontSize: 22),
            );
          },
          // The separators
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 16,
            );
          }),
    );
  }
}
