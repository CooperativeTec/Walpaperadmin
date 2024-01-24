import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:walpaperadmin/FirebaseCrud/FirebaseCroud.dart';
import 'package:walpaperadmin/ModelClasses/CustomeWalllpaperModelClass.dart';
import 'package:walpaperadmin/ModelClasses/Three_D_Wallpaper_modelClass.dart';

class WallpaperController extends GetxController{
  Rx<List<WallpaperModelClass>> wallpaperRxList=Rx<List<WallpaperModelClass>>([]);
  List<WallpaperModelClass> get wallpaper_geter=>wallpaperRxList.value;

  Rx<List<Three_D_wallpaperModelClass>> threedwallpaperRxList=Rx<List<Three_D_wallpaperModelClass>>([]);
  List<Three_D_wallpaperModelClass> get threedwallpaper_geter=>threedwallpaperRxList.value;

  Rx<List<WallpaperModelClass>> livewallpaperRxList=Rx<List<WallpaperModelClass>>([]);
  List<WallpaperModelClass> get livewallpaper_geter=>livewallpaperRxList.value;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    threedwallpaperRxList.bindStream(FirebaseCrud.AllThreeDFun());
    // livewallpaperRxList.bindStream(FirebaseCrud.AllVideoWallpaperFun());
    // wallpaperRxList.bindStream(FirebaseCrud.AllWallpaperFun());
    // Function to update the stream with a shared key

  }
  void updateStreamWithSharedKey(String sharedKey) {
    wallpaperRxList.bindStream(FirebaseCrud.AllWallpaperFun(sharedKey));
  }
}