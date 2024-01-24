import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:walpaperadmin/Databas/FirebaseConfig.dart';
import 'package:walpaperadmin/FirebaseCrud/FirebaseCroud.dart';

class Custom_paper_add extends StatefulWidget {
  String? wallpaperkey;
   Custom_paper_add({super.key,required this.wallpaperkey});

  @override
  State<Custom_paper_add> createState() => _Custom_paper_addState();
}

class _Custom_paper_addState extends State<Custom_paper_add> {
  List<XFile>? _images;
 bool btnskippbool=false;
  Future<void> _pickImages() async {
    try {
      List<XFile>? result = await ImagePicker().pickMultiImage(
        imageQuality: 70,
        maxHeight: 800,
        maxWidth: 800,
      );

      if (result != null) {
        setState(() {
          _images = result;
        });
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }
  @override
  void initState() {
    Firebase.initializeApp();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Paper"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          onPressed: _pickImages,
          icon: Icon(Icons.add,size: 30,color: Colors.white,),
        ),
      ),
      body:Column(
        children: [
          Expanded(
            // mainAxisAlignment: MainAxisAlignment.center,
            // children: <Widget>[
               child:_images != null?
                GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  // padding: const EdgeInsets.all(4.0),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  children: _images!.map((XFile image) {
                    return GridTile(
                        child: kIsWeb? Image.network(image.path):Image.file(File(image.path),fit: BoxFit.cover,));
                  }).toList(),
                ):Container(),
          ),
          if (_images != null) InkWell(
            onTap: ()
            {
              // _images!.forEach((element) {
                FirebaseCrud().uploadImage(_images, widget.wallpaperkey);
                setState(() {
                  btnskippbool=true;
                });
              // });

              // });

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: btnskippbool?Center(child: CircularProgressIndicator(),):Container(
                width: MediaQuery.of(context).size.width*0.85,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey
                ),
                child: Center(child: Text("Upload",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),)),
              ),
            ),
          ) else Container()
        ],
      ),
    );
  }
}
