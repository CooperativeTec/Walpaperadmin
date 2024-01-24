import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walpaperadmin/SplashScreen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await   Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCYTM7hjqks4aEdXtKfzXlP7pMvxtrAT-k", // paste your api key here
      appId: "com.example.walpaperadmin", //paste your app id here
      messagingSenderId: "725312873565", //paste your messagingSenderId here
      projectId: "wallpaper-e0c4a", //paste your project id here
      storageBucket: "wallpaper-e0c4a.appspot.com"
    ),

    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(new GetMaterialApp(home: SplashScreen(),));
}