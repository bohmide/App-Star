// ignore_for_file: file_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/LoadingPage.dart';
import '../widgets/cardFacture.dart';

class FacturePage extends StatefulWidget {
  const FacturePage({super.key});

  @override
  State<FacturePage> createState() => _FacturePageState();
}

class _FacturePageState extends State<FacturePage> {
  bool _isLoading = true;

  final Stream<QuerySnapshot> firestore = FirebaseFirestore.instance
      .collection("facture")
      .snapshots(includeMetadataChanges: true);
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
            : Column(
                children: [
                  Flexible(flex: 1, child: Container(child: _list(context)))
                ],
              ),
      ),
    );
  }

  Widget _list(context) {
    //final List<String> myList = List.generate(20, (index) => 'Product $index');
    return StreamBuilder<QuerySnapshot>(
        stream: firestore,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("error ${snapshot.error}");
          } else if (snapshot.connectionState == ConnectionState.waiting) {}
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 16,
                    right: 20,
                  ),
                  child: cardFacture(
                      title: data["Title"],
                      description: data["Description"],
                      price: data["Prix"]),
                );
              }).toList(),
            );
          }
          return const Text("no data");
        });
  }
}
