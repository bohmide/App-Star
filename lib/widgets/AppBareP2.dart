import 'package:flutter/material.dart';

class AppBareP2 extends StatelessWidget {
  const AppBareP2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back),
      ),
      const Text(
        "Back",
      )
    ]);
  }
}
