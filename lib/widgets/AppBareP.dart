// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../screens/Notification_Page.dart';

class AppBareP extends StatelessWidget {
  const AppBareP({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _AvatarIcon(context),
          const Text(
            "STAR",
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotificationPage()));
              },
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 30,
              ))
        ],
      ),
    );
  }

  Widget _AvatarIcon(context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(
        Icons.account_circle_outlined,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
