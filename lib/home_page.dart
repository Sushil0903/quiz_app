import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/controller/main_provider.dart';
import 'package:quiz_app/helper/api_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? id=1;
 CarouselSliderController caroselcontrol=CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        shadowColor: Colors.white,
        elevation: 7,
        actions: [
          InkWell(
            onTap: () {
              ApiHelper.apiHelper.getapi();
              setState(() {

              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.refresh,color: Colors.white,size: 30,),
            ),
          )
        ],
        title: Text("Quiz App",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder(
        future: ApiHelper.apiHelper.getapi(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Text("${snapshot.error}");
          }
          else if(snapshot.hasData){
            Response? res=snapshot.data;
            List alldata=jsonDecode(res!.body);
            Provider.of<MainProvider>(context,listen: false).mcqs=alldata;
            return Column(
              children: [
                Spacer(),
                Consumer<MainProvider>(
                  builder: (BuildContext context, MainProvider value, Widget? child) {
                    return CarouselSlider(
                    carouselController: caroselcontrol,
                      items:  value.mcqs.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: 400,
                                height: 750,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Question ${value.slideindex+1}/",style: TextStyle(fontSize: 30,color: Colors.deepPurple,fontWeight: FontWeight.w600,fontFamily: "flower"),),
                                        Text("${value.mcqs.length}",style: TextStyle(fontSize: 20,color: Colors.deepPurple,fontWeight: FontWeight.w500,fontFamily: "flower"))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16,right: 8),
                                      child: Text("${i["question"]}",style: TextStyle(color: Colors.deepPurple,fontSize: 20,fontFamily: "flower"),textAlign: TextAlign.left,),
                                    ),
                                    SizedBox(height: 10,),
                                    InkWell(
                                      onTap: () {
                                        Provider.of<MainProvider>(context,listen: false).onClicked();
                                        if("answer_a"==i["correct_answer"]){
                                          Provider.of<MainProvider>(context,listen: false).addMarks();
                                        }
                                      },
                                      child: Container(
                                        height: 60,
                                        width: 280,
                                        decoration: BoxDecoration(color: (value.isClicked)?Colors.deepPurple:Colors.white,border: Border.all(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(30)),
                                        child: Center(child: Padding(
                                          padding: const EdgeInsets.all(9),
                                          child: Text("A. ${i["answers"]["answer_a"]}",style: TextStyle(color: (value.isClicked)?Colors.white:Colors.deepPurple,fontWeight: FontWeight.w600,fontFamily: "flower"),textAlign: TextAlign.left,),
                                        )),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    InkWell(
                                      onTap: () {
                                        if("answer_b"==i["correct_answer"]){
                                          Provider.of<MainProvider>(context,listen: false).addMarks();
                                        }


                                      },
                                      child: Container(
                                        height: 60,
                                        width: 280,
                                        decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(30)),
                                        child: Center(child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("B. ${i["answers"]["answer_b"]}",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w600,fontFamily: "flower")),
                                        )),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    InkWell(
                                      onTap: () {
                                        if("answer_c"==i["correct_answer"]){
                                          Provider.of<MainProvider>(context,listen: false).addMarks();
                                        }

                                      },
                                      child: Container(
                                        height: 60,
                                        width: 280,
                                        decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(30)),
                                        child: Center(child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("C. ${i["answers"]["answer_c"]}",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w600,fontFamily: "flower")),
                                        )),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    InkWell(
                                      onTap: () {
                                        if("answer_d"==i["correct_answer"]){
                                          Provider.of<MainProvider>(context,listen: false).addMarks();
                                        }

                                      },
                                      child: Container(
                                        height: 60,
                                        width: 280,
                                        decoration: BoxDecoration(border: Border.all(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(30)),
                                        child: Center(child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("D. ${i["answers"]["answer_d"]}",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w600,fontFamily: "flower")),
                                        )),
                                      ),
                                    ),
                                    Spacer(),
                                    InkWell(
                                        onTap: () {
                                          print("before ${value.slideindex}");
                                          value.slideindex++;
                                          print("after ${value.slideindex}");
                                          caroselcontrol.nextPage(duration: Duration(milliseconds: 500),curve: Curves.easeIn);

                                        },
                                        child: Text("Next >>",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold,fontSize: 25),)),
                                    Spacer()

                                  ],
                                ),
                            );
                          },
                        );
                      }).toList(),

                      options: CarouselOptions(
                        reverse: false,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        disableCenter: true,
                        height: 550,
                        aspectRatio: 20,
                        enlargeCenterPage: true,

                        onPageChanged: (index, reason) {
                          value.slideindex=index;
                          print(value.slideindex);
                        },
                      ));
                  },
                ),
                SizedBox(height: 30,),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "detail_page");
                  },
                  child: Container(
                    height: 60,
                    width: 300,
                    decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(40)),
                    child: Center(child: Text("Submit",style: TextStyle(color: Colors.white,fontSize: 27,fontWeight: FontWeight.bold),)),
                  ),
                ),
                Spacer()
              ],
            );

          }
          else{
            return Center(child: CircularProgressIndicator(),);

          }
        },),
    );
  }
}
