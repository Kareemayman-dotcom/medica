// ignore_for_file: unnecessary_overrides, prefer_final_fields, avoid_print, unused_import, unnecessary_null_comparison, prefer_if_null_operators, await_only_futures, non_constant_identifier_names
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
  late String _get_name;

  String get get_name => _get_name;

  set get_name(String get_name) {
    _get_name = get_name;
  }
  late String email, password, name;

  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  Rxn<User> _user = Rxn<User>();

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

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

  String? get user => _user.value?.email;

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
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((_user) {
        FirebaseFirestore.instance
            .collection('Users')
            .doc(_user.user!.uid)
            .set({
          'uid': _user.user?.uid,
          'email': email,
          'password': password,
          'name': name
        });
      });
      Get.offAll(patient_home());
    } catch (firebaseAuthException) {}
  }

  void getCurrentUserData() async {
    try {
      User? user = await FirebaseAuth.instance.currentUser;
      DocumentSnapshot ds = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user?.uid)
          .get()
          .then((ds) => get_name = ds.get('name'));
      print(get_name);
    } catch (e) {
      print(e.toString());
    }
  }
}
