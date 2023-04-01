import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/resources/storage_method.dart';

class AuthMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some Error Occured";
    try {
      if (email.isNotEmpty ||
          username.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StorageMethods()
            .upLoadImageToFirebase('Profile pic', file, false);
        // add user to database
        await _firestore.collection('user').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'bio': bio,
          'email': email,
          'follower': [],
          'following': [],
          'photoUrl': photoUrl
        });
        res = 'succes';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
  

  Future<String> loginMethod({ required String email,
    required String password,})async{
     String res='Some Error Occured';
      

      try {
       if (email.isNotEmpty||password.isNotEmpty) {
       await _auth.signInWithEmailAndPassword(email: email, password: password);
         res='Success';
       } else {
         res='Enter all the fields';
       } 
      } catch (err) {
           res=err.toString();
      }
      return res;
    }

}

