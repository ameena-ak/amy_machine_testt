import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firestor.dart';


abstract class AuthenticationDatasource {
  Future<void> register(String email, String password, String confirmPassword, BuildContext context);
  Future<void> login(String email, String password, BuildContext context);
}

class AuthenticationRemote extends AuthenticationDatasource {
  @override
  Future<void> login(String email, String password, BuildContext context) async {
    if (_validateEmail(email) && _validatePassword(password)) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );
      } catch (e) {
        // Handle login errors
        _showSnackBar(context, 'Error logging in: $e');
      }
    } else {
      // Handle invalid email or password
      _showSnackBar(context, 'Invalid email or password');
    }
  }

  @override
  Future<void> register(
      String email,
      String password,
      String confirmPassword,
      BuildContext context,
      ) async {
    if (_validateEmail(email) &&
        _validatePassword(password) &&
        _validateConfirmPassword(password, confirmPassword)) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(),
          password: password.trim(),
        );
        Firestore_Datasource().CreateUser(email);
      } catch (e) {
        // Handle registration errors
        _showSnackBar(context, 'Error registering user: $e');
      }
    } else {
      // Handle invalid email, password, or confirm password
      _showSnackBar(context, 'Invalid email, password, or confirm password');
    }
  }

  bool _validateEmail(String email) {
    // You can add more complex email validation if needed
    return email.isNotEmpty && email.contains('@');
  }

  bool _validatePassword(String password) {
    // You can add more complex password validation if needed
    return password.isNotEmpty && password.length >= 6;
  }

  bool _validateConfirmPassword(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
