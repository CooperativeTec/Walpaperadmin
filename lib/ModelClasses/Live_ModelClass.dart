import 'package:cloud_firestore/cloud_firestore.dart';

class LiveWallpaperModelClass{
  String? id;
  String? type;
  String? wallpaperImageVideo;
  LiveWallpaperModelClass(this.type, this.wallpaperImageVideo);
  LiveWallpaperModelClass.fromDocumentSnapshot({required DocumentSnapshot documentSnapshot}) {
    id = documentSnapshot.id;
    type=(documentSnapshot.data() as dynamic)['type'];
    wallpaperImageVideo=(documentSnapshot.data() as dynamic)['video'];
  }
}