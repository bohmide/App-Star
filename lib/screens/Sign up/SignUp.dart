// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';

import '../../widgets/LoadingPage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 128, left: 40, right: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _WlcWord(),
              _SignUpWord(),
              _CinInput(),
              _EmailInput(),
              _PswInput(),
              _CnfPswInput(),
              _btnSignUp(),
              _RolBack()
            ],
          ),
        ),
      ),
    );
  }

  Widget _WlcWord() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        "Welcome",
        style: TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget _SignUpWord() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text("Sign Up"),
    );
  }

  Widget _CinInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
        Flexible(
            flex: 1,
            child: Container(
              color: Colors.amber,
            )),
        const Flexible(
          flex: 3,
          child: TextField(
            decoration: InputDecoration(
                hintText: "CIN*",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1)))),
          ),
        ),
      ]),
    );
  }

  Widget _EmailInput() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Email",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1)))),
      ),
    );
  }

  Widget _PswInput() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Password*",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1)))),
      ),
    );
  }

  Widget _CnfPswInput() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: "Confirm Password*",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(1)))),
      ),
    );
  }

  Widget _btnSignUp() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () async {
            _delayed();
          },
          child: const Text("Sign Up")),
    );
  }

  Widget _RolBack() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back)),
    );
  }

  void _delayed() async {
    _loadingPopUp(context);
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);
    _validatPopUp(context, true);
  }

  void _loadingPopUp(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            content: SizedBox(height: 60, width: 60, child: LoadingPage()),
          );
        });
  }

  void _validatPopUp(context, bool valid) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: SizedBox(
                  height: 60,
                  width: 60,
                  child: Center(
                      child: valid
                          ? const Text("syae")
                          : const Text("masayech"))));
        });
  }
}
