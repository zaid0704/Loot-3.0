import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class listUser extends StatefulWidget {
  listUser({Key key}) : super(key: key);

  _listUserState createState() => _listUserState();
}

class _listUserState extends State<listUser> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Chat'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            mylist(),
          ],
        ),
        
        ),);

  }
  Widget mylist()
   {
     final databaseref = Firestore.instance;
    
     return StreamBuilder(
       stream: Firestore.instance.collection("Users").snapshots(),
       builder: (context,snapshot){
         return Container(
           height: 600.0,
           child: ListView.builder(
           itemCount: snapshot.data.documents.length,
           itemBuilder:(context,index){
              return Container(
               width:double.infinity,
              
                child:Container(
                  width: double.infinity,
                  height: 70.0,
                  decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: !snapshot.hasData?CircularProgressIndicator()
                  :Card(
                  
               child:ListTile(
                 title: Text('${snapshot.data.documents[index]['email']}',
                 style: TextStyle(fontSize: 20.0,color: Colors.black),),
                 leading: CircleAvatar(
                   backgroundColor: Colors.green,
                   foregroundColor: Colors.black,
                 ),
               ),
                
               
               elevation: 6.0,  
               color: Colors.white,   
                       ),
                ),
                 
              );
           } ,
         ),
         );
         
       },
     );
}
}