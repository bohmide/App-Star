// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../Login/LoginBody.dart';
import 'Securite.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _UserPicture(),
              _UserNameEmail(),
              const SizedBox(
                height: 36,
              ),
              _BtnSecurite(),
              _BtnSignOut(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _UserPicture() {
    Size size = MediaQuery.of(context).size;

    return ClipRRect(
      child: Align(
        alignment: Alignment.center,
        child: Icon(
          Icons.account_circle_rounded,
          color: Colors.green,
          size: size.height * 0.2,
        ),
      ),
    );
  }

  Widget _UserNameEmail() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: const Column(
          children: [
            Text("user name"),
            Text("email@example.com"),
          ],
        ),
      ),
    );
  }

  Widget _BtnSecurite() {
    Size size = MediaQuery.of(context).size;

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Securite())));
          },
          child: Container(
            color: Colors.grey[100],
            height: size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                children: [
                  const Icon(Icons.security_outlined),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: size.width * 0.05),
                      child: const Text("Securite"),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: size.height * 0.02,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget _BtnSignOut() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
          Navigator.pop(context);

          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const Login())));
        },
        child: Container(
          color: Colors.grey[100],
          height: size.height * 0.06,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Row(
              children: [
                const Icon(Icons.logout_outlined),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: const Text("Sign out"),
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: size.height * 0.02,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
