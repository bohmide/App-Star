// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class ProfileConstat extends StatefulWidget {
  const ProfileConstat({
    super.key,
    required this.title,
    required this.description,
    required this.date,
  });
  final String title;
  final String description;
  final String date;

  @override
  State<ProfileConstat> createState() => _ProfileConstatState();
}

class _ProfileConstatState extends State<ProfileConstat> {
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
                  _nameClient(),
                  const SizedBox(
                    height: 10,
                  ),
                  _description(),
                  _Btns(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.date)),
                  )
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
                  color: Colors.green,
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

  Widget _nameClient() {
    return Text(
      widget.title,
      style: const TextStyle(fontSize: 22),
    );
  }

  Widget _description() {
    return Text(widget.description);
  }

  Widget ReturnIcon(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Theme.of(context).primaryColor,
        ));
  }

  Widget _Btns() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("tekbel?")),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return _alertNoValid();
                    });
              },
              child: const Text("le?")),
        ]);
  }

  Widget _alertNoValid() {
    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Container(),
        ),
        AlertDialog(
          content: Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: Column(
              children: [
                const Text("alech ma9beltech"),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                      maxLines: 8,
                      decoration:
                          InputDecoration(border: OutlineInputBorder())),
                ),
                _BtnsAlert(),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(),
        )
      ],
    );
  }

  Widget _BtnsAlert() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                //kamel el base
              },
              child: const Text("submit")),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Annuler")),
        ]);
  }
}
