// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/CardClient.dart';
import 'Expert_Profile_Constat.dart';

class ListClient extends StatefulWidget {
  const ListClient({super.key});

  @override
  State<ListClient> createState() => _ListClientState();
}

class _ListClientState extends State<ListClient> {
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
              padding: const EdgeInsets.only(top: 0, left: 16.0, right: 16),
              child: ListView.separated(
                itemCount: 15,
                itemBuilder: (context, i) {
                  return i == 0
                      ? Text("List des Client",
                          style: GoogleFonts.poppins(
                            fontSize: size.height * 0.035,
                            fontWeight: FontWeight.bold,
                          ))
                      : CardClient();
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              ),
            )));
  }

  Widget CardClient() {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ProfileConstat(
                    description: 'karhba madhrouba click for more..',
                    date: '13/8/2015',
                    title: 'Foulen ben foulen',
                  ))),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: const cardClient(
            description: 'karhba madhrouba click for more..',
            date: '13/8/2015',
            title: 'Foulen ben foulen',
          )),
    );
  }
}
