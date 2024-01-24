import 'package:cloud_firestore/cloud_firestore.dart';

class WallpaperModelClass{
  String? id;
  String? type;
  String? WallpaperImage;
  WallpaperModelClass(this.type, this.WallpaperImage);
  WallpaperModelClass.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    type=(documentSnapshot.data() as dynamic)['type'];
    WallpaperImage=(documentSnapshot.data() as dynamic)['image'];
  }
}