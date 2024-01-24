import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:walpaperadmin/FirebaseCrud/FirebaseCroud.dart';

class Three_d_wallpaper_upload extends StatefulWidget {
  const Three_d_wallpaper_upload({super.key});

  @override
  State<Three_d_wallpaper_upload> createState() => _Three_d_wallpaper_uploadState();
}

class _Three_d_wallpaper_uploadState extends State<Three_d_wallpaper_upload> {
  XFile? _images;
  XFile? _images2;
  XFile? _images3;
  bool btnskippbool=false;
  Future<void> _pickImages1() async {
    try {
      XFile? result = await ImagePicker().pickImage(
        imageQuality: 70,
        maxHeight: 800,
        maxWidth: 800,
        source: ImageSource.gallery
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
  Future<void> _pickImages2() async {
    try {
      XFile? result = await ImagePicker().pickImage(
          imageQuality: 70,
          maxHeight: 800,
          maxWidth: 800,
          source: ImageSource.gallery
      );

      if (result != null) {
        setState(() {
          _images2 = result;
        });
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }
  Future<void> _pickImages3() async {
    try {
      XFile? result = await ImagePicker().pickImage(
          imageQuality: 70,
          maxHeight: 800,
          maxWidth: 800,
          source: ImageSource.gallery
      );

      if (result != null) {
        setState(() {
          _images3 = result;
        });
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.35,
                width: MediaQuery.of(context).size.width*0.45,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: _pickImages1,
                  child:_images==null? Center(
                    child: CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.add),
                    ),
                  ):kIsWeb? Image.network(_images!.path,fit: BoxFit.cover,):Image.file(File(_images!.path )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.35,
                width: MediaQuery.of(context).size.width*0.45,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  onTap: _pickImages2,
                  child:_images2==null? Center(
                    child: CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.add),
                    ),
                  ):kIsWeb? Image.network(_images2!.path,fit: BoxFit.cover,):Image.file(File(_images2!.path )),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.35,
            width: MediaQuery.of(context).size.width/2,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: _pickImages3,
              child: _images3==null?Center(
                child: CircleAvatar(
                  radius: 40,
                  child: Icon(Icons.add),
                ),
              ):kIsWeb? Image.network(_images3!.path,fit: BoxFit.cover,):Image.file(File(_images3!.path )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            // Center(child: CircularProgressIndicator(),):
              InkWell(
                onTap: (){
                  List<XFile>? _imagesList=[];
                  if(_images==null){
                    Get.snackbar("First Image Select","");
                  }
                  // else{
                  //   // setState(() {
                  //     _imagesList!.add(_images!);
                  //   // });
                  // }
                  else if(_images2==null){
                    Get.snackbar("Second Image Select","");
                  }
                    // else{
                    //   setState(() {
                    //     _imagesList!.add(_images2!);
                    //   });
                    // }
                  else  if(_images3==null){
                    Get.snackbar("Third Image Select","");
                  }
                    else{
                      // setState(() {
                        _imagesList!.add(_images!);
                        _imagesList.add(_images2!);
                        _imagesList.add(_images3!);
                      // });
                    }
                  if(_imagesList!.length!=3)
                  {
                    Get.snackbar("Not Upload", "Please Select 3 Image");
                  }
                    {
                      FirebaseCrud().uploadThreedImage(_imagesList, "3D");
                    }
                },
                child: Container(
                width: MediaQuery.of(context).size.width*0.85,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey
                ),
                child: Center(child: Text("Upload",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),)),
                            ),
              ),
          ),
        ],
      ),
    );
  }
}
