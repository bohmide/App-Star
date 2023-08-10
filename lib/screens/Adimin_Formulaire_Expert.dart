// ignore_for_file: prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/button_widget.dart';

class FormulaireExpert extends StatefulWidget {
  final String? cin;
  final String? name;
  final String? lastName;
  final String? psw;
  final String? email;
  final String? adress;
  const FormulaireExpert(
      {super.key,
      this.cin,
      this.name,
      this.lastName,
      this.psw,
      this.email,
      this.adress});

  @override
  State<FormulaireExpert> createState() => _FormulaireExpertState();
}

class _FormulaireExpertState extends State<FormulaireExpert> {
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
        body: Container(
          padding: const EdgeInsets.only(top: 24, left: 40, right: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SignUpWord(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                ),
                _CinInput(),
                _EmailInput(),
                _AdressInput(),
                _PswInput(),
                _CnfPswInput(),
                _btnSignUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _WlcWord() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        "Welcome",
        style: TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
      ),
    );
  }

  Widget _SignUpWord() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: widget.cin == null
          ? Text("Ajouter un Expert",
              style: GoogleFonts.poppins(
                fontSize: size.height * 0.035,
                fontWeight: FontWeight.bold,
              ))
          : Text("modifier un Expert",
              style: GoogleFonts.poppins(
                fontSize: size.height * 0.035,
                fontWeight: FontWeight.bold,
              )),
    );
  }

  Widget _CinInput() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: buildTextField(
        "CIN",
        Icons.person,
        false,
        size,
        (valuemail) {
          if (valuemail.length < 8) {
            buildSnackError(
              'Invalid cin',
              context,
              size,
            );
            return '';
          }

          return null;
        },
        false,
      ),
    );
  }

  Widget _EmailInput() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: buildTextField(
        "Adresse",
        Icons.location_on,
        false,
        size,
        (valuemail) {
          if (valuemail.length < 8) {
            buildSnackError(
              'Invalid cin',
              context,
              size,
            );
            return '';
          }

          return null;
        },
        false,
      ),
    );
  }

  Widget _PswInput() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: buildTextField(
        "password",
        Icons.lock,
        true,
        size,
        (valuemail) {
          if (valuemail.length < 8) {
            buildSnackError(
              'Invalid cin',
              context,
              size,
            );
            return '';
          }

          return null;
        },
        false,
      ),
    );
  }

  Widget _CnfPswInput() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: buildTextField(
        "confirme password",
        Icons.lock,
        true,
        size,
        (valuemail) {
          if (valuemail.length < 8) {
            buildSnackError(
              'Invalid cin',
              context,
              size,
            );
            return '';
          }

          return null;
        },
        false,
      ),
    );
  }

  Widget _AdressInput() {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: buildTextField(
        "Email",
        Icons.email,
        false,
        size,
        (valuemail) {
          if (valuemail.length < 8) {
            buildSnackError(
              'Invalid cin',
              context,
              size,
            );
            return '';
          }

          return null;
        },
        false,
      ),
    );
  }

  Widget _btnSignUp() {
    Size size = MediaQuery.of(context).size;

    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.03, horizontal: size.width * 0.2),
        child: ButtonWidget(
            text: widget.cin == null ? 'Ajouter' : 'modifier',
            backColor: const [
              Colors.green,
              Color.fromARGB(255, 33, 160, 99),
            ],
            textColor: const [
              Colors.white,
              Colors.white,
            ],
            onPressed: () {}));
  }

  Widget buildTextField(
    String hintText,
    IconData icon,
    bool password,
    size,
    FormFieldValidator validator,
    bool isDarkMode,
  ) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.000),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.05,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.black : const Color(0xffF7F8F8),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Form(
          child: TextFormField(
            style: TextStyle(
                color: isDarkMode ? const Color(0xffADA4A5) : Colors.black),
            onChanged: (value) {},
            validator: validator,
            textInputAction: TextInputAction.next,
            obscureText: false,
            decoration: InputDecoration(
              errorStyle: const TextStyle(height: 0),
              hintStyle: const TextStyle(
                color: Color(0xffADA4A5),
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(
                top: size.height * 0.012,
                bottom: size.height * 0.012,
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
                        onTap: () {},
                        child: const Icon(
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
