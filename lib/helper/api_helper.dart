

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class ApiHelper{
  ApiHelper._();
  static final ApiHelper apiHelper=ApiHelper._();


  Future<http.Response> getapi() async{

   http.Response res=  await http.get(Uri.parse("https://quizapi.io/api/v1/questions?apiKey=F9MkiwyCJhWufKoAscZGQwTdNdB4RjzNBO2jEUQQ&category=linux&difficulty=Hard&limit=20"));
   return res;
  }






}