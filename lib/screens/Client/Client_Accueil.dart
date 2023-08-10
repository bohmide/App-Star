// ignore_for_file: file_names, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../../utils/Scrolling_Notif.dart';
import '../../widgets/Card1.dart';
import '../Constat.dart';

import '../Facture_Page.dart';
import '../Rendez-vous_Page.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      controller: _scrollController,
      child: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          // ignore: avoid_print
          print(direction);
          if (direction == ScrollDirection.reverse) {
            Provider.of<MyModel>(context, listen: false).MyVariables = true;
          } else if (direction == ScrollDirection.forward) {
            Provider.of<MyModel>(context, listen: false).MyVariables = false;
          }
          return true;
        },
        child: Container(
          padding: const EdgeInsets.only(top: 8),
          height: MediaQuery.of(context).size.height,
          child: ListView(children: [
            Column(
              children: [
                const Text(
                  "Nos Services",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                //_Calendar(),
                const SizedBox(
                  height: 10,
                ),
                Center(child: _ListOption())
              ],
            ),
          ]),
        ),
      ),
    ));
  }

  Widget _ListOption() {
    return const Wrap(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Card1(
              title: "Facture",
              image: 'assets/SVG_P/Invoice.svg',
              pageToGo: FacturePage()),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Card1(
              title: "Constat",
              image: 'assets/SVG_P/test1.svg',
              pageToGo: Portfolio()),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Card1(
              title: "Rendez-vous",
              image: 'assets/SVG_P/RV.svg',
              pageToGo: Rv_Page()),
        ),
      ],
    );
  }
}
