// ignore: file_names
// ignore_for_file: camel_case_types, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/Scrolling_Notif.dart';
import '../Expert/Expert_HomePage.dart' as Expert;
import '../Client/Client_HomePage.dart' as Client;

class Authentif_Expert_client extends StatelessWidget {
  const Authentif_Expert_client({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Continuer en tant que :",
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ChangeNotifierProvider(
                    create: (_) => MyModel(),
                    child: const Expert.HomePage(),
                  );
                }));
              },
              child: const Text(
                "Expert",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChangeNotifierProvider(
                      create: (_) => MyModel(),
                      child: const Client.HomePage(),
                    );
                  }));
                },
                child: const Text("client", style: TextStyle(fontSize: 20)))
          ],
        ),
      ),
    );
  }
}
