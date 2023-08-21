import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:twitter_login/twitter_login.dart';

import '../custom_exception/internet_exception/no_internet.dart';
import '../custom_exception/sign_in_exceptions/user_not_found.dart';
import '../custom_exception/sign_in_exceptions/wrong_password.dart';
import '../custom_exception/sign_up_exceptions/email_already_in_use.dart';
import '../custom_exception/sign_up_exceptions/weak_password.dart';
import '../model/user_DM.dart';

abstract class FirebaseManager {
  static Future<void> signIn(String email, String password) async {
    try {
      if (!await InternetConnectionChecker().hasConnection) {
        throw NoInternet();
      }
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      await getUserFromFireStore(credential.user!.uid,email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFound();
      } else if (e.code == 'wrong-password') {
        throw WrongPassword();
      }
    }
  }

  static Future<void> signUp(
      String userName, String email, String password) async {
    try {
      if (!await InternetConnectionChecker().hasConnection) {
        throw NoInternet();
      }
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await saveUserInFireStore(credential.user!.uid,email,userName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPassword();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyInUse();
      }
    }
  }

  static Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  static Future<UserCredential> signInWithTwitter() async {
    // Create a TwitterLogin instance
    final twitterLogin = TwitterLogin(
        apiKey: '<your consumer key>',
        apiSecretKey: ' <your consumer secret>',
        redirectURI: '<your_scheme>://');

    // Trigger the sign-in flow
    final authResult = await twitterLogin.login();

    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(twitterAuthCredential);
  }

  static Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<void> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (exception) {
      print(exception.toString());
    }
  }

  static Future saveUserInFireStore(String uid, String email, String userName) {
    CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
    DocumentReference userDocument = userCollection.doc(uid);
    return userDocument.set({"id": uid, "email": email, "username": userName});
  }

  static Future<UserDM> getUserFromFireStore(String uid,String email) async {
    CollectionReference userCollection =
    FirebaseFirestore.instance.collection("users");
    DocumentReference doc = userCollection.doc(uid);
    DocumentSnapshot snapshot = await doc.get();
    Map json = snapshot.data() as Map;
    UserDM user = UserDM(
        id: uid, email: email, userName: json["username"]);
    return user;
  }
}
