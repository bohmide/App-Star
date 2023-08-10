// ignore_for_file: file_names, non_constant_identifier_names, unused_element

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/LoadingPage.dart';
import '../widgets/button_widget.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  //
  Future<bool> checkLocalStorage(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }

  void saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  TextStyle textStyle() {
    return const TextStyle(fontSize: 24);
  }

  void StrorageTestAdd() async {
    String? result = await getData("test1");
    if (result != null) {
      test = await getData("test1");
    } else {
      test = "vide";
    }
  }

  String? test;
  String? _fileName1;
  File? _fileToDisplay1;
  PlatformFile? _pickedFile1;

  String? _fileName2;
  File? _fileToDisplay2;
  PlatformFile? _pickedFile2;

  bool _isloading1 = false;
  bool _isloading2 = false;

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

  void _pickFileCar() async {
    try {
      setState(() {
        _isloading2 = true;
      });

      FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: false);
      if (result != null) {
        _fileName2 = result.files.first.name;
        _pickedFile2 = result.files.first;
        _fileToDisplay2 = File(_pickedFile2!.path.toString());

        // ignore: avoid_print
        print("File name $_fileName2"); //test

        setState(() {
          _isloading2 = false;
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void _pickFileConsta() async {
    try {
      setState(() {
        _isloading1 = true;
      });

      FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: false);
      if (result != null) {
        _fileName1 = result.files.first.name;
        _pickedFile1 = result.files.first;
        _fileToDisplay1 = File(_pickedFile1!.path.toString());

        // ignore: avoid_print
        print("File name $_fileName1"); //test

        setState(() {
          _isloading1 = false;
          saveData("test1", "!!! $_fileName1");
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    StrorageTestAdd();
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
            : Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StorageTestDisplay(),
                      _ConstaLabel(),
                      _PickerConsta(),
                      _CarLabel(),
                      _PickeCarPicture(),
                      _BtnAdd()
                    ]),
              ),
      ),
    );
  }

  Widget _ConstaLabel() {
    return Text(
      "consta",
      style: textStyle(),
    );
  }

  Widget _PickerConsta() {
    return GestureDetector(
      onTap: () {
        _pickFileConsta();
      },
      // ignore: sized_box_for_whitespace
      child: _isloading1
          ? const CircularProgressIndicator()
          : Container(
              padding: const EdgeInsets.only(
                  bottom: 24, top: 24, left: 16, right: 16),
              //color:Colors.amber,
              //height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_pickedFile1 != null)
                      Container(
                        color: Colors.black,
                        //height: 128,
                        width: 100,
                        child: Image.file(_fileToDisplay1!),
                      ),
                    const Center(
                      child: Text("Add +"),
                    ),
                  ]),
            ),
    );
  }

  Widget _CarLabel() {
    return Text(
      "karhba madhrouba",
      style: textStyle(),
    );
  }

  Widget _PickeCarPicture() {
    return GestureDetector(
      onTap: () {
        _pickFileCar();
      },
      // ignore: sized_box_for_whitespace
      child: _isloading2
          ? const CircularProgressIndicator()
          : Container(
              padding: const EdgeInsets.only(
                  bottom: 24, top: 24, left: 16, right: 16),
              //height: MediaQuery.of(context).size.height / 8,
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_pickedFile2 != null)
                      SizedBox(
                        //height: 128,
                        width: 100,
                        child: Image.file(_fileToDisplay2!),
                      ),
                    const Center(
                      child: Text("Add +"),
                    )
                  ]),
            ),
    );
  }

  Widget _BtnAdd() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Container(
        width: size.width * 0.3,
        child: ButtonWidget(
            text: 'Envoyer',
            backColor: const [
              Colors.green,
              Color.fromARGB(255, 33, 160, 99),
            ],
            textColor: const [
              Colors.white,
              Colors.white,
            ],
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                prefs.clear();
              });
            }),
      ),
    );
  }

  Widget StorageTestDisplay() {
    return FutureBuilder<bool>(
      future: checkLocalStorage(
          'test1'), // Replace 'username' with your desired key
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          // Local storage check completed successfully
          if (snapshot.data!) {
            // Key exists in local storage
            return Text('::$test');
          } else {
            // Key does not exist in local storage
            return const Text('Data not found in local storage');
          }
        } else if (snapshot.hasError) {
          // Error occurred during local storage check
          return Text('Error occurred: ${snapshot.error}');
        } else {
          // Local storage check still in progress
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
