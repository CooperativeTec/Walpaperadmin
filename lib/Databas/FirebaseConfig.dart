
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' as io;

import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storagege.dart';
  FirebaseAuth mAth = FirebaseAuth.instance;
  // var storage = Firebase.storage();
  FirebaseFirestore db = FirebaseFirestore.instance;
  var imageId = (DateTime.timestamp().microsecond);
// Assuming you have Firebase initialized in your project
// const firebase = require('firebase/app');
// require('firebase/firestore');
// require('firebase/storage');

// Reference to Firestore
//   var db = firebase.firestore();
FirebaseStorage storage = FirebaseStorage.instance;
// Reference to Storage
//   const  = firebase.storage();

// Function to upload image and store information in Firestore

  uploadImage(file, description) async{
    // Generate a unique ID for the image
    // var imageId =1; // Implement your own function to generate unique IDs

    // Upload the image to Firebase Storage
    var storageRef = storage.ref().child('images/' + imageId.toString());
    await storageRef.putFile(file);

    // Get the download URL of the uploaded image
    var imageUrl = await storageRef.getDownloadURL();

    // Store image information in Firestore
    await db.collection(description).doc(imageId as String?).set({
      "image":imageUrl,
      "des":description,
      // "timestamp": db..serverTimestamp(),
    });

    // console.log('Image uploaded and information stored successfully!');
  }

// Example usage
//   var file = /* Your image file */;
//   const description = 'A beautiful landscape';

