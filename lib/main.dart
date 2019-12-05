import 'package:flutter/material.dart';
import 'package:login_using_api/loginPage.dart';
import 'package:login_using_api/registerPage.dart';
import 'package:login_using_api/landingPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes:{
        '/':(context)=>Login(),
        '/register':(context)=>Register(),
        '/landing':(context)=>Landing(),
      },
    );
  }
}


