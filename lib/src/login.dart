import 'package:flutter/material.dart';
class loginUser extends StatefulWidget {
  loginUser({Key key}) : super(key: key);

  _loginUserState createState() => _loginUserState();
}

class _loginUserState extends State<loginUser> {
  @override
  final email =TextEditingController();
  final password = TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Login'),
        ),
        body : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
              labelText: 'Enter your Email',
         ),
       controller: email,
     ),
     Padding(
       padding: EdgeInsets.all(8.0),
     ),
     
     TextField(
              decoration: InputDecoration(
              labelText: 'Password',
              
         ),
       controller: password,
     ),
      Padding(
       padding: EdgeInsets.all(8.0),
     ),
     RaisedButton(
       padding: EdgeInsets.all(10.0),
       elevation: 6.0,
       child: Text('login',style: TextStyle(fontSize: 20.0,color: Colors.white),),
       onPressed: login,
       color: Colors.blue,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0) ),
                    
     )
          ],
        ),
        
      ),
    );
  }
 void login()
  {
   Navigator.of(context).pushNamed("listUser");
  }
}