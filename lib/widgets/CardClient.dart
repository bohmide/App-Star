import 'package:flutter/material.dart';

class cardClient extends StatefulWidget {
  const cardClient(
      {super.key,
      required this.title,
      required this.description,
      required this.date});
  final String title;
  final String description;
  final String date;

  @override
  State<cardClient> createState() => _cardClientState();
}

class _cardClientState extends State<cardClient> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.black54),
      ),
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width,
      child: Column(
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
                      child: Text(
                        widget.description,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(widget.date)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
