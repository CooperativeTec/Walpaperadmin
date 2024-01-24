import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:walpaperadmin/Controller/WallpaperController.dart';
import 'package:walpaperadmin/FullScreenImage.dart';
import 'package:walpaperadmin/PaperSubCatagory/Custom_paper_add.dart';

class UploadedCustomPages extends StatefulWidget {
  String? wallpaperkey;
   UploadedCustomPages({super.key,@required this.wallpaperkey});

  @override
  State<UploadedCustomPages> createState() => _UploadedCustomPagesState();
}

class _UploadedCustomPagesState extends State<UploadedCustomPages> {
  late final WallpaperController wallpaperController  = Get.find();
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(WallpaperController());
    wallpaperController.updateStreamWithSharedKey(widget.wallpaperkey.toString());
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){
            Get.to(Custom_paper_add(wallpaperkey: widget.wallpaperkey,)) ;
          },
          label: Icon(Icons.add)),
      appBar: AppBar(
        title: Text("Custom Paper Add"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        // leading: IconButton(
        //   onPressed: (){
        //     Get.to(Custom_paper_add(wallpaperkey: widget.wallpaperkey,)) ;
        //   },
        //   icon: Icon(Icons.add,size: 30,color: Colors.white,),
        // ),
      ),
      body:    Expanded(child:
      GetX<WallpaperController>(
          init: Get.put<WallpaperController>(WallpaperController()),
          builder: (WallpaperController todoController) {
            print('the length of data is: ${todoController.wallpaper_geter.length}');
            return todoController.wallpaper_geter.length==0?Center(child: CircularProgressIndicator(color: Colors.white,),):Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5)
                ),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:2.0,
                      mainAxisSpacing: 2.0,
                    ),
                    // physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //   crossAxisCount: 2,
                    //   crossAxisSpacing: 5.0,
                    //   mainAxisSpacing: 5.0,
                    // ),
                    // scrollDirection: Axis.vertical,
                    itemCount: todoController.wallpaper_geter.length,
                    itemBuilder: (BuildContext context, int index) {
                      print(todoController.wallpaper_geter[index].type);
                      final _todoModel = todoController.wallpaper_geter[index];
                      return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                              onTap: (){
                                Get.to(FullScreenImage(imageUrl: _todoModel.WallpaperImage,));
                              },
                              child: kIsWeb?Image(image: NetworkImage(_todoModel.WallpaperImage!),fit: BoxFit.cover,):Image(image: NetworkImage(_todoModel.WallpaperImage!),fit: BoxFit.cover,))
                      );
                    }
                )
            );
          }
      )
      )
      // StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      //   stream: FirebaseFirestore.instance.collection("custompaper").snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       return GridView.builder(
      //         // physics: NeverScrollableScrollPhysics(),
      //         shrinkWrap: true,
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2,
      //           crossAxisSpacing:2.0,
      //           mainAxisSpacing: 2.0,
      //         ),
      //         itemCount: snapshot.data!.docs.length,
      //         itemBuilder: (context, index) {
      //           return InkWell(
      //               onTap: (){
      //                 Get.to(FullScreenImage(imageUrl:snapshot.data!.docs[index].get('image'),));
      //               },
      //               child: Image(image: NetworkImage(snapshot.data!.docs[index].get('image')),fit: BoxFit.cover,));
      //           //   ListTile(
      //           //   title: Text(
      //           //     snapshot.data!.docs[index].get('type'),
      //           //   ),
      //           // );
      //         },
      //       );
      //     }
      //     if (snapshot.hasError) {
      //       return const Text('Error');
      //     } else {
      //       return Center(child: const CircularProgressIndicator());
      //     }
      //   },
      // )
    );
  }
}
