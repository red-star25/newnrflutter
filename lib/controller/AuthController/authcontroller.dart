import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nrlifecare/data/sharedPrefs/sharedPrefs.dart';
import 'package:nrlifecare/wigdets/CustomSnackbar/customWidgets.dart';
import '../../view/Authentication/verifyLoading.dart';

class AuthController extends GetxController {
  static final _emailController = TextEditingController();
  static final _passwordController = TextEditingController();
  static final _confirmpasswordController = TextEditingController();

  TextEditingController get email => _emailController;
  TextEditingController get password => _passwordController;
  TextEditingController get confirmpassword => _confirmpasswordController;

  RxBool isLoading = false.obs;
  RxBool isResizeToAvoidBottom = false.obs;
  RxBool isOnBoard = false.obs;

  // ------------------------------------------------------------------------
  // REGISTER USER WITH EMAIL

  Future registerUser(GlobalKey<FormState> key) async {
    if (key.currentState.validate()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .then((value) {
          isLoading.value = true;
          Get.to(VerifyLoading());
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          CustomWidgets.customAuthSnackbar(
              message: "Email already in use",
              title: "Enter other email address");
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  // ---------------------------------------------------------
  // LOGIN USER WITH EMAIL

  Future loginUser(GlobalKey<FormState> key) async {
    if (key.currentState.validate()) {
      try {
        isLoading.value = true;
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text)
            .then((UserCredential value) async {
          await FirebaseFirestore.instance
              .collection("Users")
              .doc(value.user.uid)
              .set({"uId": value.user.uid});
          await SharedPrefs.setIsLoggedIn(isLoggedIn: true);
          await SharedPrefs.setUid(uId: value.user.uid);
          await SharedPrefs.setUserName(userName: value.user.displayName);
          await SharedPrefs.setPhotoUrl(photoUrl: value.user.photoURL);
          await SharedPrefs.setEmail(email: value.user.email);
          isLoading.value = false;
          _emailController.clear();
          _passwordController.clear();
          Get.toNamed("/home");
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          CustomWidgets.customAuthSnackbar(
              message: "User not found with entered email",
              title: "Please enter valid email");
          isLoading.value = false;
        } else if (e.code == 'wrong-password') {
          CustomWidgets.customAuthSnackbar(
              message: "Entered password does not match",
              title: "Incorrect Password");
          isLoading.value = false;
        }
      }
    }
  }

  // -------------------------------------------------------
  //GOOGLE SIGN IN
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(credential);
  }

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

  String phoneNumberValidator(String number) {
    if (number.isEmpty) {
      return "Please enter a valid phone number";
    }
    if (number.length < 10) {
      return "Number should be 10 digit long";
    }
    if (number.length > 10) {
      return "Number should be 10 digit long";
    }
    return null;
  }

  String otpValidator(String otp) {
    if (otp.isEmpty) {
      return "Please enter a valid OTP";
    }
    if (otp.length < 6) {
      return "OTP should be 6 digit long";
    }
    if (otp.length > 6) {
      return "OTP should be 10 digit long";
    }
    return null;
  }

  void navigateToHome() {
    Get.offNamed("/home");
  }

  void clearTextField() {
    _emailController.text = "";
    _passwordController.text = "";
    _confirmpasswordController.text = "";
  }

  Future<void> getOnBoardState() async {
    isOnBoard.value = await SharedPrefs.getOnBoard();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    getOnBoardState();
    super.onInit();
  }
}
