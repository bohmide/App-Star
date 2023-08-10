// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/button_widget.dart';

class ForgPwd extends StatefulWidget {
  const ForgPwd({super.key});

  @override
  State<ForgPwd> createState() => _ForgPwdState();
}

class _ForgPwdState extends State<ForgPwd> {
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
          preferredSize: Size(size.width, size.height * 0.05),
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
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.05,
                      left: size.width * 0.055,
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Reset password',
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
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.055),
                    child: Align(
                      child: Text(
                        "Forgot your password? That's okay, it happens to everyone!\nPlease provide your email to reset your password.",
                        style: GoogleFonts.poppins(
                          color: isDarkMode ? Colors.white54 : Colors.black54,
                          fontSize: size.height * 0.02,
                        ),
                      ),
                    ),
                  ),
                  Form(
                    child: buildTextField(
                      "Email",
                      Icons.email_outlined,
                      false,
                      size,
                      (valuemail) {
                        if (valuemail.length < 5) {
                          buildSnackError(
                            'Invalid email',
                            context,
                            size,
                          );
                          return '';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                            .hasMatch(valuemail)) {
                          buildSnackError(
                            'Invalid email',
                            context,
                            size,
                          );
                          return '';
                        }
                        return null;
                      },
                      isDarkMode,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.025),
                    child: ButtonWidget(
                        text: 'Send Instruction',
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
                          if (_emailKey.currentState!.validate()) {
                            print('$email forgot password');
                          }
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
