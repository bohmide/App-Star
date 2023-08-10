// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/LoadingPage.dart';

class Rv_Page extends StatefulWidget {
  const Rv_Page({super.key});

  @override
  State<Rv_Page> createState() => _Rv_PageState();
}

class _Rv_PageState extends State<Rv_Page> {
  var items = [
    '8h',
    '9h',
    '10h',
    '11h',
    '12h',
  ];
  String dropdownvalue = '8h';
  bool _isLoading = true;

  void _delayLoading() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _delayLoading();
  }

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
        body: _isLoading
            ? const LoadingPage()
            : Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_filter(), _map(context), _listExpert()],
                ),
              ),
      ),
    );
  }

  Widget _listExpert() {
    return Flexible(
      flex: 2,
      child: Column(
        children: [
          const Center(
            child: Text(
              "Choisir un Expert",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
                padding: const EdgeInsets.only(top: 16),
                //color: Colors.amber,
                child: _list(context)),
          ),
        ],
      ),
    );
  }

  Widget _filter() {
    return Column(
      children: [
        const Text(
          "Filter",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        DropdownButton(
            value: dropdownvalue,
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    items,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            })
      ],
    );
  }

  Widget _map(BuildContext context) {
    const LatLng sourceLocation = LatLng(36.883783, 10.170828);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.black54),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: sourceLocation,
              zoom: 14.5,
            ),
            markers: {
              const Marker(
                  markerId: MarkerId("source"), position: sourceLocation)
            },
          ),
        ),
      ),
    );
  }

  Widget _list(context) {
    final List<String> myList = List.generate(100, (index) => 'Product $index');
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
                  showDialog<void>(
                    context: context,
                    barrierDismissible: true, // user must tap button!
                    builder: (BuildContext context) {
                      return AlertDialog(
                        // <-- SEE HERE
                        title: const Text('Exper'),
                        content: const SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('metyaked fi ekhtiyaratek?'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Yes'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
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
