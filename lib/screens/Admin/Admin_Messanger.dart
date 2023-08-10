// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../discussion_Page.dart';

class Messanger extends StatefulWidget {
  const Messanger({
    super.key,
  });

  @override
  State<Messanger> createState() => _MessangerState();
}

class _MessangerState extends State<Messanger> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Flexible(
          flex: 1,
          child: Container(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: _list(context)),
        ),
      ],
    ));
  }

  Widget _list(context) {
    final List<String> myList = List.generate(100, (index) => 'client $index');
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
      ),
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: myList.length,
          // The list items
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20, top: 16, right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const discussion_Page())));
                },
                child: Text(
                  myList[index],
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            );
          },
          // The separators
          separatorBuilder: (context, index) {
            return const Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.black54,
            );
          }),
    );
  }
}
