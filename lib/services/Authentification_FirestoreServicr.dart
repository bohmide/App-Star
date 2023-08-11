// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/User.dart';

class Authentification_FirestoreService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('user');

  Future<void> createUser(
    String cin,
    String name,
    String lastName,
    String email,
    String password,
    String adress,
    String role,
  ) {
    return usersCollection.doc().set({
      'Cin': cin,
      'Name': name,
      'LastName': lastName,
      'Email': email,
      'Password': password,
      'Adress': adress,
      'Role': role,
    });
  }

  Future<void> createOUser(UserData user) {
    return usersCollection.doc().set({
      'Cin': user.cin,
      'Name': user.name,
      'lastName': user.lastName,
      'Email': user.email,
      'Password': user.password,
      'Adress': user.adress,
      'Role': user.role,
    });
  }

  Future<bool> isUserValid(String cin, String password) async {
    try {
      // Query the 'users' collection to find the user with the provided username.
      final userSnapshot =
          await usersCollection.where('Cin', isEqualTo: cin).limit(1).get();

      if (userSnapshot.docs.isEmpty) {
        return false; // User with the provided username not found.
      }

      // Validate the password or any other authentication logic you have.
      // For this example, we are assuming a simple password check.
      final userDoc = userSnapshot.docs.first;
      final userPassword = userDoc['Password'];

      return userPassword == password;
    } catch (e) {
      return false;
    }
  }

  Future<bool> isUserExist(String cin) async {
    try {
      // Query the 'users' collection to find the user with the provided username.
      final userSnapshot =
          await usersCollection.where('Cin', isEqualTo: cin).limit(1).get();

      if (userSnapshot.docs.isNotEmpty) {
        return true; // User with the provided username not found.
      }
      return false; // User with the provided username not found.
    } catch (e) {
      return false;
    }
  }

  Future<String> getUserRole(String cin) async {
    try {
      final userData =
          await usersCollection.where('Cin', isEqualTo: cin).limit(1).get();
      if (userData.docs.isNotEmpty) {
        final userDoc = userData.docs.first;
        final userRole = userDoc["Role"];
        return userRole;
      } else {
        return "null";
      }
    } catch (e) {
      print("Error $e");
      return "null";
    }
  }

  Future<Map<String, dynamic>> getUserProfile(String cin) async {
    try {
      final userDoc = await usersCollection.doc(cin).get();
      if (userDoc.exists) {
        return userDoc.data() as Map<String, dynamic>;
      } else {
        return {}; // Empty map if the user document doesn't exist.
      }
    } catch (e) {
      return {}; // Empty map in case of any error.
    }
  }

  Future<void> updateUserProfile(
      String userId, String newDisplayName, String newProfilePictureUrl) {
    return usersCollection.doc(userId).update({
      'displayName': newDisplayName,
      'profilePictureUrl': newProfilePictureUrl,
    });
  }
}
