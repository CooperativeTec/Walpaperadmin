import 'package:cloud_firestore/cloud_firestore.dart';

class Three_D_wallpaperModelClass{
  String? id;
  String? type;
  List<String>? WallpaperImageList;
  Three_D_wallpaperModelClass(this.type, this.WallpaperImageList);
  Three_D_wallpaperModelClass.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    type=(documentSnapshot.data() as dynamic)['type'];
    WallpaperImageList=(documentSnapshot.data() as dynamic)['image'];
  }
}