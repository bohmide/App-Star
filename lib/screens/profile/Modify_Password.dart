// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/button_widget.dart';

class ModifyPwd extends StatefulWidget {
  const ModifyPwd({super.key});

  @override
  State<ModifyPwd> createState() => _ModifyPwdState();
}

class _ModifyPwdState extends State<ModifyPwd> {
  String email = '';

  // ignore: unused_field
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();

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
                  padding: EdgeInsets.only(
                    top: size.height * 0.05,
                    left: size.width * 0.055,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Reset password',
                      style: GoogleFonts.poppins(
                        color:
                            isDarkMode ? Colors.white : const Color(0xff1D1617),
                        fontSize: size.height * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.055),
                  child: Align(
                    child: Text(
                      "Forgot your password? That's okay, it happens to everyone!.",
                      style: GoogleFonts.poppins(
                        color: isDarkMode ? Colors.white54 : Colors.black54,
                        fontSize: size.height * 0.02,
                      ),
                    ),
                  ),
                ),
                Form(
                  child: buildTextField(
                    " Ancien Mot de passe",
                    Icons.lock_outline,
                    true,
                    size,
                    (valuepassword) {
                      if (valuepassword.length < 6) {
                        buildSnackError(
                          'Invalid password',
                          context,
                          size,
                        );
                        return '';
                      }
                      return null;
                    },
                    _passwordKey,
                    3,
                    isDarkMode,
                  ),
                ),
                Form(
                    child: buildTextField(
                  "Nouveau Mot de passe",
                  Icons.lock_outline,
                  true,
                  size,
                  (valuepassword) {
                    if (valuepassword.length < 6) {
                      buildSnackError(
                        'Invalid password',
                        context,
                        size,
                      );
                      return '';
                    }
                    return null;
                  },
                  _confirmPasswordKey,
                  4,
                  isDarkMode,
                )),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.025),
                  child: ButtonWidget(
                      text: 'Changer Mot de passe',
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
                        if (_passwordKey.currentState!.validate()) {
                          print('$email forgot password');
                        }
                      }),
                ),
              ],
            ),
          ),
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
    Key key,
    int stringToEdit,
    bool isDarkMode,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.025),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.05,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : const Color(0xffF7F8F8),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Form(
          key: key,
          child: TextFormField(
            style: TextStyle(
                color: isDarkMode ? const Color(0xffADA4A5) : Colors.black),
            onChanged: (value) {
              setState(() {});
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
                top: size.height * 0.012,
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
