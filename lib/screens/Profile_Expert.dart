// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/button_widget.dart';
import 'Adimin_Formulaire_Expert.dart';

class ProfileExpert extends StatefulWidget {
  final String cin;
  final String name;
  final String lastName;
  final String psw;
  final String? email = null;
  final String adress;
  const ProfileExpert(
      {super.key,
      required this.cin,
      required this.name,
      required this.lastName,
      required this.psw,
      email,
      required this.adress});

  @override
  State<ProfileExpert> createState() => _ProfileExpertState();
}

class _ProfileExpertState extends State<ProfileExpert> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _ImagesContainer(),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16.0, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _nameInfo(),
                  const SizedBox(
                    height: 10,
                  ),
                  _cinInfo(),
                  _addressInfo(),
                  _emailInfo(),
                  _Btns(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _ImagesContainer() {
    return Stack(children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(88)),
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.3,
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.green, Color.fromARGB(255, 33, 160, 99)],
                  ),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(40))),
            )),
      ),
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
            padding: const EdgeInsets.all(8.0), child: ReturnIcon(context)),
      )
    ]);
  }

  Widget _nameInfo() {
    Size size = MediaQuery.of(context).size;

    return Text("${widget.name}  ${widget.lastName}",
        style: GoogleFonts.poppins(
          fontSize: size.height * 0.035,
          fontWeight: FontWeight.bold,
        ));
  }

  Widget _addressInfo() {
    return Text("${widget.adress}");
  }

  Widget _emailInfo() {
    return Text(widget.email ?? "");
  }

  Widget _cinInfo() {
    return Text("${widget.cin}");
  }

  Widget ReturnIcon(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ));
  }

  Widget _Btns() {
    Size size = MediaQuery.of(context).size;

    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.3,
            child: ButtonWidget(
                text: 'Modifier',
                backColor: const [
                  Colors.green,
                  Color.fromARGB(255, 33, 160, 99),
                ],
                textColor: const [
                  Colors.white,
                  Colors.white,
                ],
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormulaireExpert(
                                adress: "lese9 lel kram",
                                cin: "6666666",
                                email: null,
                                lastName: "Ali",
                                name: "Habib",
                                psw: "Star",
                              )));
                }),
          ),
        ]);
  }
}
