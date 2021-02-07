import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nrlifecare/constants/colors.dart';

class AuthController extends GetxController {
  static final _emailController = TextEditingController();
  static final _passwordController = TextEditingController();
  static final _confirmpasswordController = TextEditingController();

  TextEditingController get email => _emailController;
  TextEditingController get password => _passwordController;
  TextEditingController get confirmpassword => _confirmpasswordController;

  String emailValidate(String email) {
    if (email.isEmpty) {
      return "Please enter an email";
    }
    if (!RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email)) {
      return "Email invalid";
    }
    return null;
  }

  String passwordValidate(String password) {
    if (password.isEmpty) {
      return "Please enter a password";
    }
    if (password.length < 6) {
      return "Password should be atleast 6 character long";
    }
    return null;
  }

  String confirmPasswordValidate(String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return "Please enter a password";
    }
    if (confirmPassword.length < 6) {
      return "Password should be atleast 6 character long";
    }
    if (confirmPassword != _passwordController.text) {
      return "Password does not match";
    }
    return null;
  }

  void navigateToHome(GlobalKey<FormState> key) async {
    if (key.currentState.validate()) {
      Get.offNamed("/home");
    } else {}
  }

  void clearTextField() {
    _emailController.text = "";
    _passwordController.text = "";
    _confirmpasswordController.text = "";
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }
}