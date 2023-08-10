// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SpinKitCircle(
          color: Theme.of(context).primaryColor,
          size: 50.0,
          duration: const Duration(seconds: 1),
        ),
      ),
    );
  }
}
