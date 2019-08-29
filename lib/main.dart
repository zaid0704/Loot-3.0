import 'package:flutter/material.dart';
import 'src/frontBody.dart';
import 'src/SignUp.dart';

import 'src/login.dart';
import 'src/listUser.dart';
void main()
 {
   runApp(frontPage());
 }
class frontPage extends  StatefulWidget {
  
 createState() =>frontState();
}

class frontState extends State<frontPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String,WidgetBuilder>{
            "/loginScreen":(context) => login(),
             "/loginUser":(context)=>loginUser(),
             "listUser":(context)=>listUser()
          },
      home: Scaffold(
        
        appBar: AppBar(
          title:Text('My Login Screen'),
          backgroundColor: Colors.green,
        ),
        body:HomePage(),
      ),

    );
    
    
  }
}