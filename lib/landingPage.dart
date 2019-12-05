import 'package:flutter/material.dart';

class Landing extends StatefulWidget{
  @override
  LandingPage createState() => LandingPage();
}

class LandingPage extends State<Landing>{

  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          child: FlatButton(
            onPressed: (){Navigator.popAndPushNamed(context, '/');},
            child: Text('Logout'),
          ),
        ),
      ),
    );
  }
}