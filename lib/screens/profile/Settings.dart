// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/Dark_Mod_Notif.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isDark = true;

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
          padding: const EdgeInsets.only(top: 18.0, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_PageName(), DarkMode()],
          ),
        ),
      ),
    );
  }

  Widget _PageName() {
    return const Text(
      "Setting",
      style: TextStyle(fontSize: 24),
    );
  }

  Widget DarkMode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "dark mode",
          style: TextStyle(fontSize: 20),
        ),
        IconButton(
            onPressed: () {
              setState(() {
                _isDark = !_isDark;
                Provider.of<ThemeModeProvider>(context, listen: false)
                    .toggleThemeMode();
              });
            },
            icon:
                Icon(_isDark ? Icons.check_box_outline_blank : Icons.check_box))
      ],
    );
  }
}
