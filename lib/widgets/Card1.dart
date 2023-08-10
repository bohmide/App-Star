// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Card1 extends StatelessWidget {
  final String title;
  final String image;
  final pageToGo;

  const Card1(
      {super.key,
      required this.title,
      required this.image,
      required this.pageToGo});

  @override
  Widget build(BuildContext context) {
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
                child: SvgPicture.asset(
                  image,
                  height: 80,
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
