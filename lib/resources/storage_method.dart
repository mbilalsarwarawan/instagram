import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StorageMethods{
  final FirebaseStorage _storage= FirebaseStorage.instance;
  final FirebaseAuth _auth= FirebaseAuth.instance;
  // adding image to firebase storge

  Future<String> upLoadImageToFirebase(String childName, Uint8List file, bool isPost) async {

  // create foldar in firebase storage for the post and data
    Reference ref=_storage.ref().child(childName).child(_auth.currentUser!.uid);
 
// uploading the picture on the firestore
    UploadTask uploadTask=ref.putData(file);
    TaskSnapshot snap=await uploadTask;
//generate the url of the uploaded picture so we access the pic
    String downloadUrl= await snap.ref.getDownloadURL();
    return downloadUrl;
  }



}