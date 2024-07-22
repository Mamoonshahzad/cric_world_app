import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationServices {
  final _auth = FirebaseAuth.instance;
  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      Get.snackbar('Error', 'There is error in creating user',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: CupertinoColors.systemYellow);
    }
    return null;
  }

  Future<User?> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred.user;
    } catch (e) {
      Get.snackbar('Error', 'There is error in logging in',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: CupertinoColors.systemYellow);
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      _auth.signOut();
    } catch (e) {
      Get.snackbar('Error', 'There is error in logging out',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: CupertinoColors.systemYellow);
    }
  }
}
