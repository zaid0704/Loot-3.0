import 'package:flutter/material.dart';
import 'src/frontBody.dart';
import 'src/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.green,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          
        ),
        appBarTheme: AppBarTheme(
          
          
          textTheme: ThemeData.light().textTheme.copyWith(title: TextStyle(fontFamily: 'Quicksand',
          fontSize: 20.0,
          fontWeight: FontWeight.bold))
        )
      ),    
      home: Scaffold(
        
        appBar:AppBar(
          title:Text('My Login Screen'),
          backgroundColor: Colors.green,
        ),
        body: HomePage(),
      ),

    );
    
    
  }
}