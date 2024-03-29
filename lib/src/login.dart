import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:whatssapp/src/listUser.dart';
class loginUser extends StatefulWidget {
  loginUser({Key key}) : super(key: key);

  _loginUserState createState() => _loginUserState();
}

class _loginUserState extends State<loginUser> {
  @override
   bool loginState ;
  void initState() { 
    super.initState();
    setState(() {
    //  loginState=false; 
    });
    
  }
  final email =TextEditingController();
  final password = TextEditingController();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(title: Text('Login'),
        ),
        body : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextField(
              keyboardType: TextInputType.emailAddress,
              onSubmitted: (_)=>login(),
              decoration: InputDecoration(
              labelText: 'Enter your Email',
              border: OutlineInputBorder(),
         ),
       controller: email,
     ),
            ),
            
     Padding(
       padding: EdgeInsets.all(8.0),
     ),
     Padding(
       padding: EdgeInsets.only(bottom: 20.0,right: 20.0,left: 20.0),
       child:TextField(
       keyboardType: TextInputType.text,
       obscureText: true,
       onSubmitted: (_)=>login(),
              decoration: InputDecoration(
              labelText: 'Password',
               border: OutlineInputBorder(),
              
         ),
       controller: password,
     ) ,
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
    String input_email = email.text;
    String input_password = password.text;
    try{
    FirebaseAuth.instance.signInWithEmailAndPassword(email: input_email,password:input_password)
    .then((onValue){
      Navigator.of(context).pushNamed("listUser");
      setState(() {
       loginState=true; 
      });

    });
    }
    catch(e){
      return ;
    }
     
    
  //  Navigator.of(context).pushNamed("listUser");
  }
}