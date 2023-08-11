// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously
// ignore: library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:star/screens/Admin/Admin_HomePage.dart' as AdminHome;
// ignore: library_prefixes
import 'package:star/screens/Client/Client_HomePage.dart' as ClientHome;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:star/widgets/LoadingPage.dart';
import '../../utils/Check_Connection.dart';
import '../../utils/Scrolling_Notif.dart';
import '../../widgets/button_widget.dart';
import '../Forg_Pwd.dart';
import 'athentif_Expert_Client.dart';
import '../../services/Authentification_FirestoreServicr.dart';
import '../../utils/Local_Storage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  bool checkedValue = false;
  bool register = false;
  List textfieldsStrings = [
    "", //CIN 0
    "", //address 1
    "", //email 2
    "", //password 3
    "", //confirmPassword 4
    "", //name 5
    "", //lastname 6
    "" //role 7
  ];

  TextEditingController cin = TextEditingController();
  String expert = "87654321";
  String admin = "00000000";
  String client = "12345678";

  final _cinkey = GlobalKey<FormState>();
  final _addresskey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();
  final _confirmPasswordKey = GlobalKey<FormState>();
  final _nameKey = GlobalKey<FormState>();
  final _lastNameKey = GlobalKey<FormState>();
  final _roleKey = GlobalKey<FormState>();

  Local_Storage localStorage = Local_Storage();
  Authentification_FirestoreService authFirestoreService =
      Authentification_FirestoreService();

  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    initialization();
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    bool isConnected = await ConnectionChecker.isConnected();
    setState(() {
      _isConnected = isConnected;
    });
  }

  void initialization() async {
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: isLoading
          ? const LoadingPage()
          : Scaffold(
              body: Center(
                child: Container(
                  height: size.height,
                  width: size.height,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.02),
                    child: SafeArea(
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                _textHeyTher(size),
                                _textWelcome(size),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.01),
                                ),
                                _cinInpute(size),
                                register ? _nameInpute(size) : Container(),
                                register ? _lastNameInpute(size) : Container(),
                                register ? _roleInpute(size) : Container(),
                                register ? _emailInpute(size) : Container(),
                                register ? _adressInpute(size) : Container(),
                                _pwdInpute(size),
                                register ? _pwdCnfrm(size) : Container(),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: size.width * 0.015,
                                      vertical: size.height * 0.025,
                                    ),
                                    child: register
                                        ? CheckboxListTile(
                                            title: _klemMayrahHad(size),
                                            activeColor:
                                                const Color(0xff7B6F72),
                                            value: checkedValue,
                                            onChanged: (newValue) {
                                              setState(() {
                                                checkedValue = newValue!;
                                              });
                                            },
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          )
                                        : _btnForgPwd(size)),
                                StreamBuilder<bool>(
                                  stream:
                                      ConnectionChecker.connectivityStream(),
                                  initialData: false,
                                  builder: (context, snapshot) {
                                    bool isConnected = snapshot.data ?? false;
                                    return _btnLoginRegister(
                                        size, context, isConnected);
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                _textAHAC(size),
                                register
                                    ? SizedBox(
                                        height: size.height * 0.5,
                                      )
                                    : Container()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _textAHAC(size) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        children: [
          TextSpan(
            text: register
                ? "Already have an account? "
                : "Don’t have an account yet? ",
            style: TextStyle(
              color: const Color(0xff1D1617),
              fontSize: size.height * 0.018,
            ),
          ),
          WidgetSpan(
            child: InkWell(
              onTap: () => setState(() {
                if (register) {
                  register = false;
                } else {
                  register = true;
                }
              }),
              child: register
                  ? Text(
                      "Login",
                      style: TextStyle(
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: <Color>[
                              Colors.green,
                              Color.fromARGB(255, 33, 160, 99),
                            ],
                          ).createShader(
                            const Rect.fromLTWH(
                              0.0,
                              0.0,
                              200.0,
                              70.0,
                            ),
                          ),
                        fontSize: size.height * 0.018,
                      ),
                    )
                  : Text(
                      "Register",
                      style: TextStyle(
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: <Color>[
                              Colors.green,
                              Color.fromARGB(255, 33, 160, 99),
                            ],
                          ).createShader(
                            const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                          ),
                        // color: const Color(0xffC58BF2),
                        fontSize: size.height * 0.018,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textHeyTher(size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.02),
      // text hey there
      child: Text(
        'Hey there,',
        style: GoogleFonts.poppins(
          color: const Color(0xff1D1617),
          fontSize: size.height * 0.02,
        ),
      ),
    );
  }

  Widget _textWelcome(size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.015),
      child: register
          ? Text(
              'Create an Account',
              style: GoogleFonts.poppins(
                color: const Color(0xff1D1617),
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.bold,
              ),
            )
          : Text(
              'Welcome Back',
              style: GoogleFonts.poppins(
                color: const Color(0xff1D1617),
                fontSize: size.height * 0.025,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }

  Widget _cinInpute(size) {
    return buildTextField(
      "CIN",
      Icons.pin_outlined,
      false,
      size,
      (valuecin) {
        if ((valuecin.length != 8 &&
            !RegExp("^[0-9]+[0-9]\$").hasMatch(valuecin))) {
          buildSnackError(
            'CIN invalide',
            context,
            size,
          );
          return '';
        }
        return null;
      },
      _cinkey,
      0,
      false,
    );
  }

  Widget _adressInpute(size) {
    return buildTextField(
      "Address",
      Icons.location_on_outlined,
      false,
      size,
      (valueaddress) {
        if (valueaddress.length <= 2) {
          buildSnackError(
            'Address invalide',
            context,
            size,
          );
          return '';
        }
        return null;
      },
      _addresskey,
      1,
      false,
    );
  }

  Widget _nameInpute(size) {
    return buildTextField(
      "Name",
      Icons.person_outlined,
      false,
      size,
      (valueaddress) {
        if (valueaddress.length <= 2) {
          buildSnackError(
            'name invalide',
            context,
            size,
          );
          return '';
        }
        return null;
      },
      _nameKey,
      5,
      false,
    );
  }

  Widget _lastNameInpute(size) {
    return buildTextField(
      "Last name",
      Icons.person_outlined,
      false,
      size,
      (valueaddress) {
        if (valueaddress.length <= 2) {
          buildSnackError(
            'Last Name invalide',
            context,
            size,
          );
          return '';
        }
        return null;
      },
      _lastNameKey,
      6,
      false,
    );
  }

  Widget _roleInpute(size) {
    return buildTextField(
      "Role",
      Icons.work_outline,
      false,
      size,
      (valueaddress) {
        if (valueaddress.length <= 2) {
          buildSnackError(
            'Role invalide',
            context,
            size,
          );
          return '';
        }
        return null;
      },
      _roleKey,
      7,
      false,
    );
  }

  Widget _btnLoginRegister(size, context, connection) {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 500),
      padding: register
          ? EdgeInsets.only(top: size.height * 0.025)
          : EdgeInsets.only(top: size.height * 0.085),
      child: ButtonWidget(
        text: register ? "Register" : "Login",
        backColor: const [
          Colors.green,
          Color.fromARGB(255, 33, 160, 99),
        ],
        textColor: const [
          Colors.white,
          Colors.white,
        ],
        onPressed: () async {
          print('login');
          if (connection) {
            if (register) {
              //validation for register
              if (_emailKey.currentState!.validate()) {
                if (_addresskey.currentState!.validate()) {
                  if (_cinkey.currentState!.validate()) {
                    if (_passwordKey.currentState!.validate()) {
                      if (_confirmPasswordKey.currentState!.validate()) {
                        if (checkedValue == false) {
                          buildSnackError(
                              'Accept our Privacy Policy and Term Of Use',
                              context,
                              size);
                        } else {
                          print('register');
                          register = !register;
                          if (!await authFirestoreService
                              .isUserExist(textfieldsStrings[0])) {
                            authFirestoreService.createUser(
                                textfieldsStrings[0],
                                textfieldsStrings[5],
                                textfieldsStrings[6],
                                textfieldsStrings[2],
                                textfieldsStrings[3],
                                textfieldsStrings[1],
                                textfieldsStrings[7]);
                          } else if (await authFirestoreService
                              .isUserExist(textfieldsStrings[0])) {
                            buildSnackError('Cin deja existe', context, size);
                            print("Cin deja existe");
                          }
                        }
                      }
                    }
                  }
                }
              }
            } else {
              //validation for login
              if (_cinkey.currentState!.validate()) {
                if (_passwordKey.currentState!.validate()) {
                  setState(() {
                    isLoading = true;
                  });
                  print('login');
                  if (await authFirestoreService.isUserValid(
                      textfieldsStrings[0], textfieldsStrings[3])) {
                    final userRole = await authFirestoreService
                        .getUserRole(textfieldsStrings[0]);
                    if (userRole == "S_User") {
                      localStorage.saveUserId(textfieldsStrings[0]);
                      print("Client");
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return ChangeNotifierProvider(
                          create: (_) => MyModel(),
                          child: const ClientHome.HomePage(),
                        );
                      }));
                    } else if (userRole == "E_User") {
                      localStorage.saveUserId(textfieldsStrings[0]);
                      print("Expert");
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Authentif_Expert_client()));
                    } else if (userRole == "A_User") {
                      localStorage.saveUserId(textfieldsStrings[0]);
                      print("Admin");
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return ChangeNotifierProvider(
                          create: (_) => MyModel(),
                          child: const AdminHome.HomePage(),
                        );
                      }));
                    }
                  } else {
                    setState(() {
                      isLoading = false;
                      buildSnackError("Compte non valide", context, size);
                    });
                  }
                }
              }
            }
          } else {
            buildSnackError("no connection", context, size);
          }
        },
      ),
    );
  }

  Widget _emailInpute(size) {
    return buildTextField(
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
      _emailKey,
      2,
      false,
    );
  }

  Widget _pwdInpute(size) {
    return buildTextField(
      "Passsword",
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
      false,
    );
  }

  Widget _pwdCnfrm(size) {
    return buildTextField(
      "Confirm Passsword",
      Icons.lock_outline,
      true,
      size,
      (valuepassword) {
        if (valuepassword != textfieldsStrings[3]) {
          return '';
        }
        return null;
      },
      _confirmPasswordKey,
      4,
      false,
    );
  }

  Widget _klemMayrahHad(size) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        children: [
          TextSpan(
            text: "By creating an account, you agree to our ",
            style: TextStyle(
              color: const Color(0xffADA4A5),
              fontSize: size.height * 0.015,
            ),
          ),
          WidgetSpan(
            child: InkWell(
              onTap: () {
                print('Conditions of Use');
              },
              child: Text(
                "Conditions of Use",
                style: TextStyle(
                  color: const Color(0xffADA4A5),
                  decoration: TextDecoration.underline,
                  fontSize: size.height * 0.015,
                ),
              ),
            ),
          ),
          TextSpan(
            text: " and ",
            style: TextStyle(
              color: const Color(0xffADA4A5),
              fontSize: size.height * 0.015,
            ),
          ),
          WidgetSpan(
            child: InkWell(
              onTap: () {
                print('Privacy Notice');
              },
              child: Text(
                "Privacy Notice",
                style: TextStyle(
                  color: const Color(0xffADA4A5),
                  decoration: TextDecoration.underline,
                  fontSize: size.height * 0.015,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _btnForgPwd(size) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ForgPwd()),
        );
      },
      child: Text(
        "Forgot your password?",
        style: TextStyle(
          color: const Color(0xffADA4A5),
          decoration: TextDecoration.underline,
          fontSize: size.height * 0.02,
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
        decoration: const BoxDecoration(
          color: Color(0xffF7F8F8),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Form(
          key: key,
          child: TextFormField(
            style: const TextStyle(color: Colors.black),
            onChanged: (value) {
              setState(() {
                textfieldsStrings[stringToEdit] = value;
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
