// ignore_for_file: file_names, camel_case_types

import 'package:shared_preferences/shared_preferences.dart';

class Local_Storage {
  Future<void> saveUserId(String cin) async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('userId', cin);
  }

  Future<String> getUserId(String cin) async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    return prefer.getString('userId') ?? "null";
  }

  Future<void> deletUserId(String cin) async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.remove('userId');
  }
}
