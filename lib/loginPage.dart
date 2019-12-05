import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Login extends StatefulWidget{
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<Login>{
TextEditingController username = TextEditingController();
TextEditingController password = TextEditingController();
final formKey = new GlobalKey<FormState>();
bool access = false;


  Widget build(BuildContext context){
    checkAcess();
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Text("LOGIN",textScaleFactor: 4.0,),
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
                        validator: (val) => !access ? 'Invalid Username' : null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(labelText: 'Password'),
                        validator: (val) => !access ? 'Invalid Password' : null,
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
                              child: Text('Login'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: Colors.red,
                            margin: EdgeInsets.all(5.0),
                            child: FlatButton(
                              onPressed: (){cleartxt();},
                              child: Text('Cancel'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                          color: Colors.green,
                          margin: EdgeInsets.all(5.0),
                          child: FlatButton(
                              onPressed: (){Navigator.pushNamed(context, '/register');},
                              child: Text('Register'),
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

  cleartxt(){
    setState(() {
      username.text='';
      password.text='';
    });
  }

  Future<String> checkAcess() async {
    var request = await http.get('https://ianrey.000webhostapp.com/account?Username='+username.text+'&Password='+password.text);
    try{
      if(request.statusCode==200){
        if(request.body=='Null'){
          access = false;
          return null;
        }else{
          access = true;
          return request.body;
        }
      } else {
        return null;
      }
    } catch(e) {
      print(e);
      return null;
    }
  }

  validate() async {
    await checkAcess();
    if(formKey.currentState.validate() && access){
      formKey.currentState.save();
      Navigator.popAndPushNamed(context, '/landing');
    }
  }
}