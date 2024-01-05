import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walpaperadmin/HomeScreen.dart';
import 'package:walpaperadmin/HomeScreen.dart';
class CountriesSelection extends StatefulWidget {
  const CountriesSelection({super.key});

  @override
  State<CountriesSelection> createState() => _CountriesSelectionState();
}

class _CountriesSelectionState extends State<CountriesSelection> {
  bool checklanguge=false;
   List<Map> countriesName=
  [
    {
      "name":"English",
      "image":"assets/countries/eng.png",
      "check":false,
    },
    {
      "name":"Spanish",
      "image":"assets/countries/spansh.png",
      "check":false,
    },
    {
      "name":"French",
      "image":"assets/countries/frensh.png",
      "check":false,
    },
    {
      "name":"India",
      "image":"assets/countries/india.png",
      "check":false,
    },
    {
      "name":"Portugese",
      "image":"assets/countries/portgos.png",
      "check":false,
    },
    {
      "name":"German",
      "image":"assets/countries/german.png",
      "check":false,
    }

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Languages",style: TextStyle(fontSize: 18,color: Colors.white),) ,
      //   backgroundColor: Colors.transparent,
      //   foregroundColor: Colors.white,
      // ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/main_full.png",),fit: BoxFit.cover)
          ),
        child: Column(
          children: [
            SizedBox(height: 30,),
          Text("Languages",style: TextStyle(fontSize: 25,color: Colors.white)),
            Expanded(
              child: ListView.builder(
                itemCount: countriesName.length,
                  itemBuilder: (context,iem){
                  // var datais=countriesName[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                              elevation: 10,
                              color: Color(0xff32223e),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundImage: AssetImage(countriesName[iem]["image"]),
                                        ),
                                      ),
                                      // Image.asset("assets/walpapericon.jpg",height: 45,width: 45,) ,
                                      Text(countriesName[iem]["name"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.white),),
                                   SizedBox(),
                                    InkWell(
                                      onTap: (){
                                        Get.offAll(HomeScreen());
                                      },
                                      child: Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                        child: Container(
                                          width: 45,
                                          height: 45,
                                          decoration: BoxDecoration(
                                            color: Color(0xff350558),
                                            borderRadius: BorderRadius.circular(40)
                                          ),
                                          child: Center(
                                            child: Icon(Icons.arrow_forward_ios,size: 35,color: Colors.white,),
                                          ),
                                        ),
                                      ),
                                    )
                                    ],
                                  ),

                      )
                    ),
                  );
                  }),
            ),
          ],
        )
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Card(
        //         elevation: 10,
        //         color: Colors.blueGrey,
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceAround,
        //             children: [
        //               CircleAvatar(
        //                 radius: 30,
        //                 backgroundImage: AssetImage("assets/walpapericon.jpg"),
        //               ),
        //               // Image.asset("assets/walpapericon.jpg",height: 45,width: 45,) ,
        //               Text("English",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),),
        //               Checkbox(
        //                   value: checklanguge,
        //                   semanticLabel: "abcd",
        //                   checkColor: Colors.white,
        //                   onChanged:(val){
        //                 setState(() {
        //                   checklanguge=val!;
        //                 });
        //                   })
        //             ],
        //           ),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
