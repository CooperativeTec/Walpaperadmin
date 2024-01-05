import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walpaperadmin/PaperSubCatagory/Custom_paper_add.dart';

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
                child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    padding: const EdgeInsets.all(4.0),
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    children: <String>[
                       "Custom",
                      "Home",
                      "3D"
                    ].map((String url) {
              return InkWell(
                onTap: (){
                  if(url=="Custom") {
                    Get.to(Custom_paper_add());
                  }
                },
                child: GridTile(
                child:Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.85,
                            height: 80,
                            child:Center(child: Text(url,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),))
                          ),
                        )
                // Image.network(url, fit: BoxFit.cover)
                ),
              );
              }).toList()),

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
