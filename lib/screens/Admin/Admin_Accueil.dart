// ignore_for_file: file_names, non_constant_identifier_names, unused_element

import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../utils/Scrolling_Notif.dart';
import '../Expert_List_demande_Client.dart';
import '../ListExpert.dart';

class Accueil extends StatefulWidget {
  const Accueil({
    super.key,
  });

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
                    "Admin",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  //_Calendar(),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(child: _ListCard())
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _ListCard() {
    return const Wrap(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Card1(
              title: "List Client",
              icon: Icons.group_outlined,
              pageToGo: ListClient()),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Card1(
              title: "List Expert", icon: Icons.group, pageToGo: ListExpert()),
        ),
        /*Padding(
          padding: EdgeInsets.all(8.0),
          child: Card1(
              title: "List Expert",
              icon: Icons.list_alt_rounded,
              pageToGo: ListExpert()),
        ),*/
      ],
    );
  }

  Widget _HelloAdmin() {
    return Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Bonjour",
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Admin Name",
                style: TextStyle(
                  fontSize: 24,
                ),
              )
            ],
          ),
        ));
  }
}

class Card1 extends StatelessWidget {
  final String title;
  final IconData icon;
  final pageToGo;

  const Card1(
      {super.key,
      required this.title,
      required this.icon,
      required this.pageToGo});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width / 2.5,
      height: MediaQuery.of(context).size.width / 2.5,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => pageToGo));
        },
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Icon(
                  icon,
                  size: size.height * 0.09,
                ),
              ),
            ),
            Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8,
                    top: 8.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 6, right: 6),
                    width: double.infinity,
                    height: double.infinity,
                    // color: Colors.amber,
                    child: Center(
                      child: Text(
                        title,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
