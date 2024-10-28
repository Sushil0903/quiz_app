import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/controller/main_provider.dart';

import 'detail_page.dart';
import 'home_page.dart';

void main(){
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => MainProvider(),)
      ],
      builder: (context, child) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/":(context)=>HomePage(),
          "detail_page":(context)=>DetailPage(),
        },
      );
      },
    );
  }
}
