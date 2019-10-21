import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
 import 'package:cloud_firestore/cloud_firestore.dart';


class login extends StatefulWidget
 {
   @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return loginState();
  }
 }
 class loginState extends State<login>
  {
    String email , password;
    
    
    final databaseref = Firestore.instance.collection("Users").document();
  
   
    
     GlobalKey<FormState> fkey =new GlobalKey<FormState>();
    Widget build (context)
     {
       
       return MaterialApp(
        
         home: Scaffold(
           appBar: AppBar(title: Text('Sign Up'),
           ),
            body:SingleChildScrollView(
              child:         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Container(
              height :100,
              width:100,
              margin: EdgeInsets.all(30.0),
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(50.0),
                color:Colors.blue,
              ),
              child: Icon(Icons.people,size: 40.0,color: Colors.white,),
            ),
            Text('Connect with World',style: TextStyle(fontSize: 15.0)),
            Padding(
              padding: EdgeInsets.all(40.0),
            //   child: TextField(
            //   keyboardType: TextInputType.emailAddress,
            //   autofocus: true,
            //    decoration: InputDecoration(
            //    border: OutlineInputBorder(),
            //    labelText: 'Email@gmail.com',
            //    ),
            // ),
            child: Form(
              key:fkey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                onFieldSubmitted:(_){SignUp(context);} ,
                onSaved: (input){
                  email=input;
                },
                validator: (input){
                  if(!input.contains('@'))
                   {
                     return 'Enter Valid Email ';
                   }
                },
                decoration: InputDecoration(
                  labelText: 'Email@gmail.com'
                ),
              ),
               TextFormField(
                 onFieldSubmitted:(_){SignUp(context);},
                onSaved: (input){
                  password=input;
                },
                validator: (input){
                  if(input.length<6)
                   {
                     return 'Enter Valid password ';
                   }
                },
                decoration: InputDecoration(
                  labelText: 'Password'
                ),
              ),
                ],
              ),
              
           ),
             ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child:Padding(
                    padding: EdgeInsets.all(20.0),
                    child: RaisedButton(
              elevation: 6.0,
              onPressed: (){
                SignUp(context);
                 },
              color:Color(0xFF3b5998),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
              child: Text('Sign Up',style: TextStyle(fontSize: 20.0,color: Colors.white),),
            ),
                  ) ,
                ),
            //     Expanded(
            //       child:Padding(
            //         padding: EdgeInsets.all(20.0),
            //         child: RaisedButton(
            //   elevation: 6.0,
            //   onPressed: (){
            //     Login(context);
            //      },
            //   color:Color(0xFF3b5998),
            //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            //   child: Text('Login',style: TextStyle(fontSize: 20.0,color: Colors.white),),
            // ),
            //       ) ,
            //     )
              ],
            ),
            
          ],
        ),
            ),
    
         ),
       );
      
     }
     
  //     Future<void> Login(BuildContext context)async
  //  {
  //    final curr = fkey.currentState;
  //    if(curr.validate())
  //     {
  //       curr.save();
  //       try{
  //      FirebaseAuth.instance.signInWithEmailAndPassword(email: email,password: password);
  //      Toast.show("Successfull Registered into $email", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
        
  //    }catch(e)
  //    {
  //      print(e.message);
  //    }
  //     }
     
     
         
   //}
    Future<void> SignUp(BuildContext context)async
   {
     
     final curr = fkey.currentState;
     if(curr.validate())
      {
        curr.save();
        try{
       FirebaseAuth.instance.createUserWithEmailAndPassword(email: email,password: password).
       then((action)async{
         print('HEllo');
         await databaseref
      
      .setData({
        'email': '$email',
        'password': '$password'
      });
      
      Navigator.of(context).pushNamed("/loginUser");
       Toast.show("Successfull Registered", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
       });
     }catch(e)
     {
       print(e.message);
     }
      }
     
     
         
   }
  }
  