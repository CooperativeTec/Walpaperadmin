import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:walpaperadmin/CountriesSelection.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), ()=>Get.offAll(CountriesSelection()));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Expanded(
        child: Container(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/walpapericon.jpg"),
                ),
                SizedBox(height: 40,),
                Text("Millionaire Wallpaper",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),),
                SizedBox(height: 80,),
                CircularProgressIndicator()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
