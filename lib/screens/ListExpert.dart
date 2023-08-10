// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/AppBareP2.dart';
import 'Adimin_Formulaire_Expert.dart';
import 'Profile_Expert.dart';

class ListExpert extends StatefulWidget {
  const ListExpert({super.key});

  @override
  State<ListExpert> createState() => _ListExpertState();
}

class _ListExpertState extends State<ListExpert> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize:
                    Size(MediaQuery.of(context).size.width, size.height * 0.05),
                child: const AppBareP2()),
            body: Padding(
              padding: const EdgeInsets.only(top: 10, left: 16.0, right: 16),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: ListView.separated(
                      itemCount: 15,
                      itemBuilder: (context, i) {
                        return i == 0
                            ? Text(
                                "List des Expert",
                                style: GoogleFonts.poppins(
                                  fontSize: size.height * 0.035,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : CardClient();
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FormulaireExpert()));
              },
              tooltip: 'Increment',
              child: const Icon(Icons.person_add),
            )));
  }

  Widget CardClient() {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ProfileExpert(
                    adress: "lese9 lel kram",
                    cin: "6666666",
                    email: null,
                    lastName: "Ali",
                    name: "Habib",
                    psw: "Star",
                  ))),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: const cardExpert(
            description: 'karhba madhrouba click for more..',
            date: '13/8/2015',
            title: 'Foulen ben foulen',
          )),
    );
  }
}

class cardExpert extends StatefulWidget {
  const cardExpert(
      {super.key,
      required this.title,
      required this.description,
      required this.date});
  final String title;
  final String description;
  final String date;

  @override
  State<cardExpert> createState() => _cardExpertState();
}

class _cardExpertState extends State<cardExpert> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black54),
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.account_circle_sharp,
                size: size.height * 0.05,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
