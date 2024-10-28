import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/controller/main_provider.dart';
import 'package:quiz_app/helper/api_helper.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          title: Text("Result",style: TextStyle(color: Colors.white),),
        ),
        body: Center(
          child: Consumer<MainProvider>(
            builder: (BuildContext context, val, Widget? child) {
              return Column(
              children: [
                Text("Total Question : 20",style: TextStyle(fontSize: 20),),
                Text("Current Answer : ${val.totalmarks}",style: TextStyle(fontSize: 20)),
                Text("Wrong Answer : ${val.mcqs.length-val.totalmarks}",style: TextStyle(fontSize: 20)),
                Text("Score : ${val.totalmarks*100/20}%",style: TextStyle(fontSize: 20)),
                Text("Result : ${(val.totalmarks*100/val.mcqs.length)>=70 ? "Pass": "Faild"}",style: TextStyle(fontSize: 20))

              ],
            );
            },
          ),
        ),
      ),
    );
  }

}
