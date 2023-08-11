// ignore_for_file: non_constant_identifier_names, file_names, unnecessary_import, avoid_print, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:star/utils/Local_Storage.dart';
import 'package:star/widgets/Card_Notification.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  String cin = "";

  final Stream<QuerySnapshot> firestore = FirebaseFirestore.instance
      .collection("notification")
      .snapshots(includeMetadataChanges: true);

  final Local_Storage localStorage = Local_Storage();
  @override
  void initState() {
    super.initState();
    getUserId();
    print("cin: $cin");
  }

  Future<void> getUserId() async {
    cin = await localStorage.getUserId("userId");
    setState(() {}); // Trigger UI rebuild to show the updated value
  }

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
        child: _ListNotification1(),
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

  Widget _ListNotification1() {
    return StreamBuilder<QuerySnapshot>(
        stream: firestore,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("error ${snapshot.error}");
          } else if (snapshot.connectionState == ConnectionState.waiting) {}
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return data['Id'] == cin
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height / 6 + 10,
                        child: ListView.separated(
                            itemBuilder: (context, i) {
                              return Card_Notification(
                                description: 'test',
                                time: data['Time'],
                                title: data['Title'],
                              );
                            },
                            separatorBuilder: (context, i) => const SizedBox(
                                  height: 10,
                                ),
                            itemCount: 1),
                      )
                    : Container();
              }).toList(),
            );
          }
          return const Text("no data");
        });
  }
}
