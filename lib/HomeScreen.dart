import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walpaperadmin/ConstentValues.dart';
import 'package:walpaperadmin/PaperSubCatagory/Custom_paper_add.dart';
import 'package:walpaperadmin/PaperSubCatagory/CustomeIagesUploaded.dart';
import 'package:walpaperadmin/Three_d_wallpaper_Uplad.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        // leading: IconButton(
        //     onPressed: (){
        //       Get.to(Custom_paper_add(wallpaperkey:,));
        //     },
        //     icon: Icon(Icons.add)),

      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                width: MediaQuery.of(context).size.width*0.95,
                height: MediaQuery.of(context).size.height*0.15,
                color: Colors.deepPurpleAccent,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:2.0,
                      mainAxisSpacing: 2.0,
                    ),
                        itemCount: allTabs.length,
                        itemBuilder: (BuildContext context, int index) {
                          // children: <String>[
                          //    "Custom",
                          //   "Home",
                          //   "3D"
                          // ].map((String url)
                          {
                            return
                              InkWell(
                                onTap: () {
                                  if(allTabs[index]['tabno']=="3D") {
                                    Get.to(Three_d_wallpaper_upload());
                                  }
                                  else
                                    {
                                  Get.to(UploadedCustomPages(wallpaperkey: allTabs[index]['tabno'].toString()));
                                  // Get.to(Custom_paper_add());
                                  }
                                },
                                child: GridTile(
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20)),
                                      child: Container(
                                          width: MediaQuery.of(context).size.width * 0.85,
                                          height: 80,
                                          child: Center(child: Text(
                                            allTabs[index]['tabno'].toString(),
                                            style: TextStyle(fontSize: 20,
                                                fontWeight: FontWeight.w900),))
                                      ),
                                    )
                                  // Image.network(url, fit: BoxFit.cover)
                                ),
                              );
                          }
                        }
              )
              // );
        // .toList()),

                // GridView.builder(
                //   itemCount:5 ,
                //     itemBuilder: (context,itemIndex){
                //   return  Card(
                //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                //       child: Container(
                //         width: MediaQuery.of(context).size.width*0.85,
                //         height: 80,
                //         child:Center(child: Text("Custome",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),))
                //       ),
                //     );
                //     }, gridDelegate: Gr,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
