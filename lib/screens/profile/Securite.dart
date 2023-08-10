// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Modify_Email.dart';
import 'Modify_Password.dart';

class Securite extends StatefulWidget {
  const Securite({super.key});

  @override
  State<Securite> createState() => SecuriteState();
}

class SecuriteState extends State<Securite> {
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
          padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PageName(),
              SizedBox(
                height: size.height * 0.03,
              ),
              _BtnModifyEmail(),
              _BtnModifyPassword(context),
              _BtnHelp(),
              _Btnhajaokhra()
            ],
          ),
        ),
      ),
    );
  }

  Widget _PageName() {
    Size size = MediaQuery.of(context).size;
    return Text("Securite",
        style: GoogleFonts.poppins(
          fontSize: size.height * 0.035,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget _BtnModifyEmail() {
    Size size = MediaQuery.of(context).size;

    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ModifyEmail()));
          },
          child: Container(
            color: Colors.grey[100],
            height: size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                children: [
                  const Icon(Icons.email_outlined),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: size.width * 0.05),
                      child: const Text("Modifier Email"),
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

  Widget _BtnHelp() {
    Size size = MediaQuery.of(context).size;

    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ModifyEmail()));
          },
          child: Container(
            color: Colors.grey[100],
            height: size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                children: [
                  const Icon(Icons.help_outline_sharp),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: size.width * 0.05),
                      child: const Text("Help"),
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

  Widget _Btnhajaokhra() {
    Size size = MediaQuery.of(context).size;

    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ModifyEmail()));
          },
          child: Container(
            color: Colors.grey[100],
            height: size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                children: [
                  const Icon(Icons.language),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: size.width * 0.05),
                      child: const Text("Language"),
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

  Widget _BtnModifyPassword(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ModifyPwd()));
          },
          child: Container(
            color: Colors.grey[100],
            height: size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: Row(
                children: [
                  const Icon(Icons.lock_outline_sharp),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: size.width * 0.05),
                      child: const Text("Modifier Mot de passe"),
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
}
