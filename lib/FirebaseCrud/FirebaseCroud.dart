
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:walpaperadmin/ConstentValues.dart';
import 'package:walpaperadmin/HomeScreen.dart';
import 'package:walpaperadmin/ModelClasses/CustomeWalllpaperModelClass.dart';
import 'package:walpaperadmin/Databas/FirebaseConfig.dart';
import 'package:walpaperadmin/ModelClasses/Live_ModelClass.dart';
import 'package:walpaperadmin/ModelClasses/Three_D_Wallpaper_modelClass.dart';
import 'package:walpaperadmin/PaperSubCatagory/CustomeIagesUploaded.dart';
import 'package:walpaperadmin/PaperSubCatagory/Three_d_paper.dart';
class FirebaseCrud{
   static Stream<List<WallpaperModelClass>> AllWallpaperFun([String? keys]) {
      return firebaseFirestore.collection('custompaper').where("type" ,isEqualTo:keys).snapshots().map((QuerySnapshot query) {
         List<WallpaperModelClass> catagory = [];
         for (var todo in query.docs) {
            final catogorymodel = WallpaperModelClass.fromDocumentSnapshot(documentSnapshot: todo);
            catagory.add(catogorymodel);
         }
         return catagory;
      });
   }

   static Stream<List<LiveWallpaperModelClass>> AllVideoWallpaperFun([String? keys]) {
      return firebaseFirestore.collection('custompaper').where("type" ,isEqualTo:keys).snapshots().map((QuerySnapshot query) {
         List<LiveWallpaperModelClass> catagory = [];
         for (var todo in query.docs) {
            final catogorymodel = LiveWallpaperModelClass.fromDocumentSnapshot(documentSnapshot: todo);
            catagory.add(catogorymodel);
         }
         return catagory;
      });
   }
   static Stream<List<Three_D_wallpaperModelClass>> AllThreeDFun([String? keys]) {
      return firebaseFirestore.collection('custompaper').where("type" ,isEqualTo:keys).snapshots().map((QuerySnapshot query) {
         List<Three_D_wallpaperModelClass> catagory = [];
         for (var todo in query.docs) {
            final catogorymodel = Three_D_wallpaperModelClass.fromDocumentSnapshot(documentSnapshot: todo);
            catagory.add(catogorymodel);
         }
         return catagory;
      });
   }
   uploadVideo( List<File>? _images, description) async {
      _images!.forEach((element) async{
         var a=Random().nextInt(6565443);
         var next =( a * 1000000)/2;
         int imageId = (DateTime.timestamp().microsecond);
         String fileName="filname${next}with${imageId}forsavc";
         File files = File(element.path);
         var storageRef = storage.ref().child('videos/' + fileName);
         await storageRef.putFile(files);
         var imageUrl = await storageRef.getDownloadURL();
         if (imageUrl != null) {
            // Store image information in Firestore
            await db.collection("custompaper").add({
               "image": imageUrl,
               "type": description,
               // "timestamp": db..serverTimestamp(),
            })
                .then((value) {

               Get.snackbar("Data Stored", "Data Stored");
               Get.offAll(()=>HomeScreen());
            });
            // console.log('Image uploaded and information stored successfully!');
         }
         else{
            Get.snackbar("Save Failed", "Images Not Save");
         }
      });
      // Generate a unique ID for the image
      // var imageId =1; // Implement your own function to generate unique IDs
      // file.map((XFile image) async{
      // Upload the image to Firebase Storage
      // file!.map((XFile image)async{

      // });

   }
   uploadImage( List<XFile>? _images, description) async {
      _images!.forEach((element) async{
         var a=Random().nextInt(6565443);
         var next =( a * 1000000)/2;
         int imageId = (DateTime.timestamp().microsecond);
         String fileName="filname${next}with${imageId}forsavc";
         File files = File(element.path);
         var storageRef = storage.ref().child('images/' + fileName);
         await storageRef.putFile(files);
         var imageUrl = await storageRef.getDownloadURL();
         if (imageUrl != null) {
            // Store image information in Firestore
            await db.collection("custompaper").add({
               "image": imageUrl,
               "type": description,
               // "timestamp": db..serverTimestamp(),
            })
                .then((value) {

               Get.snackbar("Data Stored", "Data Stored");
            Get.offAll(()=>HomeScreen());
            });
            // console.log('Image uploaded and information stored successfully!');
         }
         else{
            Get.snackbar("Save Failed", "Images Not Save");
         }
      });
      // Generate a unique ID for the image
      // var imageId =1; // Implement your own function to generate unique IDs
      // file.map((XFile image) async{
      // Upload the image to Firebase Storage
      // file!.map((XFile image)async{

      // });

   }
      uploadThreedImage( List<XFile>? _images, description) async {
      List imagesList=[];
      for(var element in _images!) {
         try {
            var a = Random().nextInt(6565443);
            var next = (a * 1000000) / 2;
            int imageId = (DateTime
                .timestamp()
                .microsecond);
            String fileName = "filname${next}with${imageId}forsavc";

            // if(kIsWeb){
            //    storage.UploadTaskSnapshot uploadTaskSnapshot = await storage
            //        .ref('images/${html.DateTime.now().millisecondsSinceEpoch}.jpg')
            //        .put(Uint8List.fromList(bytes));
            //    String downloadURL = await uploadTaskSnapshot.ref.getDownloadURL();
            // }
            File files = File(element.path);
            // var storageRef = storage.ref().child('images/' + fileName);
            // await storageRef.putFile(files);
            String path = 'images/' + fileName;
            final metadata = SettableMetadata(
               contentType: 'image/jpeg',
               customMetadata: {'picked-file-path': files.path},
            );
            var storageRef = storage.ref().child(path);
            if (kIsWeb) {
               await storageRef.putData(await files.readAsBytes(), metadata);
            }
            else {
               await storageRef.putFile(files, metadata);
            }
            String downloadfile = await storageRef.getDownloadURL();
            imagesList.add(downloadfile);
         }catch(e){
            print(e.toString());
         }
      }
         if (imagesList == null) {
            Get.snackbar("Save Failed", "Images Not Save");
            // Store image information in Firestore

            // console.log('Image uploaded and information stored successfully!');
         }
         else {
            await db.collection("custompaper").add({
               "image": imagesList,
               "type": description,
               // "timestamp": db..serverTimestamp(),
            }).then((value) {
               Get.snackbar("Data Stored", "Data Stored");
               Get.offAll(() => HomeScreen());
            });
         }
         // });
         // Generate a unique ID for the image
         // var imageId =1; // Implement your own function to generate unique IDs
         // file.map((XFile image) async{
         // Upload the image to Firebase Storage
         // file!.map((XFile image)async{

         // });

   }
}