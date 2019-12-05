import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Register extends StatefulWidget{
  @override
  RegisterPage createState() => RegisterPage();
}

class RegisterPage extends State<Register>{
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
final formKey = new GlobalKey<FormState>();

  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Text("REGISTER",textScaleFactor: 4.0,),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        controller: username,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: 'Username'),
                        validator: (val) => val.length == 0 ? 'Invalid Username' : null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        controller: password,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (val) => val.length == 0 ? 'Invalid Password' : null,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Colors.blue,
                            margin: EdgeInsets.all(5.0),
                            child: FlatButton(
                              onPressed: validate,
                              child: Text('Ok'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.red,
                            margin: EdgeInsets.all(5.0),
                            child: FlatButton(
                              onPressed: (){Navigator.popAndPushNamed(context, '/');},
                              child: Text('Cancel'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<String> saveAccount() async {
    var request = await http.post('https://ianrey.000webhostapp.com/account',
                  body: {'Username' : username.text,'Password' : password.text});
    if(request.statusCode==200){
      return 'Success';
    }
    return 'Error';
  }
  cleartxt(){
    setState(() {
      username.text='';
      password.text='';
    });
  }

  validate() async {
    await saveAccount();
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      Navigator.popAndPushNamed(context, '/landing');
    }
  }
}