import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
Future<UserCredential?> _handlesignin() async {
  try {
    final GoogleSignInAccount? googleuser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleauth =
        await googleuser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleauth.accessToken, idToken: googleauth.idToken);
    final UserCredential userCredential =
        await _auth.signInWithCredential(credential);
    return userCredential;
  } catch (e) {
    print('enter signin$e');
    return null;
  }
}
