import 'package:flutter/widgets.dart';

TextEditingController signupEmailTextFieldController = TextEditingController();
TextEditingController signupPasswordTextFieldController =
    TextEditingController();
TextEditingController signupUsernameTextFieldController =
    TextEditingController();

TextEditingController loginEmailTextFieldController = TextEditingController();
TextEditingController loginPasswordTextFieldController =
    TextEditingController();

bool isValidPassword(String password) {
  // Check if the password is at least 8 characters long.
  if (password.length < 8) {
    return false;
  } else if (!password.contains(RegExp(r'[A-Z]'))) {
    return false;
  } else if (!password.contains(RegExp(r'[a-z]'))) {
    return false;
  } else if (!password.contains(RegExp(r'[0-9]'))) {
    return false;
  } else if (!password.contains(RegExp(r'[!@#\$&*()\-+\.,\/:;<=>?^_`{|}~]'))) {
    return false;
  } else {
    return true;
  }

  // If all of the checks pass, then the password is valid.
}

bool isValidEmail(String email) {
  // Check if the email address is empty.
  if (email.isEmpty) {
    return false;
  } else if (!email.contains('@')) {
    return false;
  } else if (!email.contains('.')) {
    return false;
  } else {
    return true;
  }

  // If all of the checks pass, then the email address is valid.
}

bool isValidUsername(String email) {
  // Check if the email address is empty.
  if (email.isEmpty) {
    return false;
  } else {
    return true;
  }
}

