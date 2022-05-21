// ignore_for_file: unnecessary_overrides, prefer_final_fields, avoid_print, unused_import, unnecessary_null_comparison, prefer_if_null_operators
// ignore_for_file: todo
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medica/patient_getstarted.dart';

import '../../patient_home.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
   late String email, password, name;
   Rxn<User> _user = Rxn<User>();
   String? get user => _user.value?.email;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    print(googleUser);
    GoogleSignInAuthentication? googleSignInAuthentication =
        await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication?.idToken,
      accessToken: googleSignInAuthentication?.accessToken,
    );
  }


  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(patient_home());
    } catch (FirebaseException) {
      print(FirebaseException);
      Get.snackbar(
        'Error login account',
        FirebaseException.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password).then((_user){
            FirebaseFirestore.instance.collection('Users').doc(_user.user!.uid).set({
                          'uid': _user.user?.uid,
                          'email': email,
                          'password': password,
                          'name': name });
          });
          Get.offAll(patient_home());
    } catch (firebaseAuthException) {}
  }
}