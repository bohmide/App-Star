// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

import 'button_widget.dart';

class cardFacture extends StatefulWidget {
  const cardFacture(
      {super.key,
      required this.title,
      required this.description,
      required this.price});
  final String title;
  final String description;
  final String price;

  @override
  State<cardFacture> createState() => _cardFactureState();
}

class _cardFactureState extends State<cardFacture> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black54),
      ),
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 24),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Text(
                          widget.description,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("${widget.price} dt")),
                ),
              ],
            ),
          ),
          Flexible(
              flex: 1,
              child: Center(
                child: Container(
                  width: size.width * 0.3,
                  child: ButtonWidget(
                      text: 'Khales',
                      backColor: const [
                        Colors.green,
                        Color.fromARGB(255, 33, 160, 99),
                      ],
                      textColor: const [
                        Colors.white,
                        Colors.white,
                      ],
                      onPressed: () async {}),
                ),
              ))
        ],
      ),
    );
  }
}
