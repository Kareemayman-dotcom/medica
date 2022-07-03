// ignore_for_file: unnecessary_overrides, prefer_final_fields, avoid_print, unused_import, unnecessary_null_comparison, prefer_if_null_operators, await_only_futures, non_constant_identifier_names, curly_braces_in_flow_control_structures, unnecessary_getters_setters
// ignore_for_file: todo
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medica/patient_getstarted.dart';
import 'package:path/path.dart';
import '../../patient_home.dart';

class AuthViewModel extends GetxController {
  late String email, password, name;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  FirebaseAuth _auth = FirebaseAuth.instance;
  late String _get_name = "NAME";
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
    get_name;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  String get get_name => _get_name;

  set get_name(String get_name) {
    _get_name = get_name;
  }

  String? get user => _user.value?.email;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
      print("image_path save");

    } else {
      Get.snackbar("Error!", "Photo Not Selected",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white);
    }
  }

  fireStore_Get_ImagePath() {
    FirebaseFirestore.instance
        .collection("usersImage").where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        if(doc != null){
          if(FirebaseAuth.instance.currentUser!.uid == doc["uid"]){
            selectedImagePath.value = doc["image_path"];
      print(1);
          }else{
            selectedImagePath.value = '';
print(0);
          }

        }
      });
    });
  }

  void deleteMemoryImage(){
 selectedImagePath.value = '';
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
        get_name = "...";
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
       FirebaseFirestore.instance
          .collection('Users')
          .doc((await FirebaseAuth.instance.currentUser)?.uid)
          .get()
          .then((ds) {
        get_name = ds.get('name').toString();
        print(get_name);
        Get.offAll(() => patient_home.withuser(get_name = ds.get('name')));
      }).catchError((e) {
        print(e);
      });
       
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
      Get.offAll(() => patient_home.withuser(name));
    } catch (firebaseAuthException) {}
  }

/*
  void getCurrentUserData() async {
        final firebaseUser = await FirebaseAuth.instance.currentUser!;
    if (firebaseUser != null)
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(firebaseUser.uid)
          .get()
          .then((ds) {
        get_name = ds.get('name');
        print(get_name);
      }).catchError((e) {
        print(e);
      });
  }
  */
  }