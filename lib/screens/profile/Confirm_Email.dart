// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/button_widget.dart';
import 'Modify_Email.dart';

class ConfirmEmail extends StatefulWidget {
  const ConfirmEmail({super.key});

  @override
  State<ConfirmEmail> createState() => _ConfirmEmailState();
}

class _ConfirmEmailState extends State<ConfirmEmail> {
  String email = '';

  final _emailKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
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
          body: Center(
              child: Container(
                  height: size.height,
                  width: size.height,
                  decoration: BoxDecoration(
                    color: isDarkMode ? const Color(0xff151f2c) : Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.15),
                        child: Icon(
                          Icons.mark_email_read,
                          size: size.height * 0.13,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.055,
                            vertical: size.height * 0.025),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Check your email',
                            style: GoogleFonts.poppins(
                              color: isDarkMode
                                  ? Colors.white
                                  : const Color(0xff1D1617),
                              fontSize: size.height * 0.035,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.055),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "We have sent an email change\n instructions to your new email.",
                            style: GoogleFonts.poppins(
                              color:
                                  isDarkMode ? Colors.white54 : Colors.black54,
                              fontSize: size.height * 0.02,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.025,
                            bottom: size.height * 0.025),
                        child: ButtonWidget(
                            text: 'Open email app',
                            backColor: isDarkMode
                                ? [
                                    Colors.black,
                                    Colors.black,
                                  ]
                                : const [
                                    Colors.green,
                                    Color.fromARGB(255, 33, 160, 99),
                                  ],
                            textColor: const [
                              Colors.white,
                              Colors.white,
                            ],
                            onPressed: () async {
                              /* if (Platform.isAndroid) {
                                AndroidIntent intent = new AndroidIntent(
                                  action: 'android.intent.action.MAIN',
                                  category:
                                      'android.intent.category..APP_EMAIL',
                                );
                                intent.launch(),catchError((e){
                                  print("Error opening mail app:  $e");
                                });
                              }*/
                            }),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ModifyEmail()));
                        },
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Skip, i'll confirm later ",
                                style: TextStyle(
                                  color: const Color(0xff1D1617),
                                  fontSize: size.height * 0.018,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )))),
    );
  }

  bool pwVisible = false;
  Widget buildTextField(
    String hintText,
    IconData icon,
    bool password,
    size,
    FormFieldValidator validator,
    bool isDarkMode,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.025),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.06,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : const Color(0xffF7F8F8),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Form(
          key: _emailKey,
          child: TextFormField(
            style: TextStyle(
                color: isDarkMode ? const Color(0xffADA4A5) : Colors.black),
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
            validator: validator,
            textInputAction: TextInputAction.next,
            obscureText: password ? !pwVisible : false,
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              hintStyle: const TextStyle(
                color: Color(0xffADA4A5),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: size.height * 0.02,
              ),
              hintText: hintText,
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.005,
                ),
                child: Icon(
                  icon,
                  color: const Color(0xff7B6F72),
                ),
              ),
              suffixIcon: password
                  ? Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.005,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            pwVisible = !pwVisible;
                          });
                        },
                        child: pwVisible
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                color: Color(0xff7B6F72),
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                color: Color(0xff7B6F72),
                              ),
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: SizedBox(
          height: size.height * 0.02,
          child: Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}
