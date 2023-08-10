// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:star/screens/Login/LoginBody.dart';
import 'package:star/utils/Dark_Mod_Notif.dart';

void main() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  initializeDateFormatting().then((_) => runApp(
        ChangeNotifierProvider(
          create: (_) => ThemeModeProvider(),
          child: const MyApp(),
        ),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color color = const Color.fromARGB(255, 28, 93, 31);

    // return Consumer<ThemeModeProvider>(builder: (context, test, child) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        primaryColor: color,
        primarySwatch: Colors.green,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
          //<-- SEE HERE
          // Status bar color
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        )),
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: Colors.greenAccent,
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.light,

      /*Provider.of<ThemeModeProvider>(context).themeMode ==
                ThemeModeType.dark
            ? ThemeMode.dark
            : ThemeMode.light,*/
      debugShowCheckedModeBanner: false,
      title: "Star",
      home: const Login(),
      builder: EasyLoading.init(),
    );
    //});
  }
}
