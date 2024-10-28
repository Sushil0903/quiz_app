import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier{
  int totalmarks=0;
  List mcqs=[];

  int slideindex=0;

  bool isClicked=false;


  void onClicked(){
    isClicked=true;
    // notifyListeners();
  }


  addMarks(){
    totalmarks++;
    notifyListeners();
  }

  resetmarks(){
    totalmarks=0;
  }

}