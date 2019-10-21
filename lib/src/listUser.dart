import 'dart:convert';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:whatssapp/src/frontBody.dart';
class listUser extends StatefulWidget {
  listUser({Key key}) : super(key: key);

  _listUserState createState() => _listUserState();
}
int c =0;
class _listUserState extends State<listUser> {
  @override
  bool _isLoding = false;
    Map <String,dynamic> map ;
    String myQues = 'Update by pressing save button';
    Future<Map<String,dynamic>> myQuestions()async{
      setState(() {
       _isLoding=true; 
      });
      http.Response response = await http.get('https://whattsapp-ae395.firebaseio.com/0.json');
      map = json.decode(response.body);
      print(map);
      setState(() {
       _isLoding=false; 
       if(c%2==0)
         {
           myQues=map['mission'] ;
         }
        else{
          myQues=map['question'] ;
          print('Question Checker');
        }
      });
      
      print(map);
    }
    Widget build (context) {
      final answerController = TextEditingController();
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title:Text('Questions'),),
          body: SingleChildScrollView(
            child: Column(
           
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
              child: Padding(padding: EdgeInsets.all(25),),
              ),
              Container(
                alignment: Alignment.center,
                child: Text('Current Question',style: TextStyle(
                  fontFamily:  'Quicksand',
                  fontSize: 30
                ),),
                decoration: BoxDecoration(
                  border:Border.all(
                    color: Colors.orange,
                  ) ,
                ),
              ),

              
              _isLoding?CircularProgressIndicator():FlatButton(
                child: Icon(Icons.navigate_next),
                onPressed: myQuestions,
                
                
              ),
              Container(
                padding: const EdgeInsets.all(15),
                alignment: Alignment.center,
                child: Text('${myQues}',style:TextStyle(fontFamily: 'Quicksand',fontSize: 30.0)),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.withOpacity(0.7),Colors.red.withOpacity(.02)]
                ) 
                ),

              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                   decoration: InputDecoration(
                   labelText: 'Enter your Answer',
                   border: OutlineInputBorder(), 
                   
                  ),
                  onSubmitted: (val){check(answerController,map);},
                  controller: answerController,
                ),
              ),)
            ],
          ),
          ),
          
        ),
      );
    }
    check (ans,Map<String,dynamic> map)
     {
       if(c%2==0)
       {
         if(ans.text==map['mission_answer'])
          {
            c++;
            print("Hello$c");
             myQuestions();
          }
       }
       else
       {
         if(ans.text==map['answer'])
          {
             c++;
          myQuestions();
          }
       }
       
       
}
}









  //       body: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: <Widget>[
  //           mylist(),
  //         ],
  //       ),
        
  //       ),);

  // }
  // Widget mylist()
  //  {
  //    final databaseref = Firestore.instance;
    
  //    return StreamBuilder(
  //      stream: Firestore.instance.collection("Users").snapshots(),
  //      builder: (context,snapshot){
  //        return Container(
  //          height: 600.0,
  //          child: ListView.builder(
  //          itemCount: snapshot.data.documents.length,
  //          itemBuilder:(context,index){
  //             return Container(
  //              width:double.infinity,
              
  //               child:Container(
  //                 width: double.infinity,
  //                 height: 70.0,
  //                 decoration: BoxDecoration(
  //                borderRadius: BorderRadius.circular(60.0),
  //                 ),
  //                 child: !snapshot.hasData?CircularProgressIndicator()
  //                 :Card(
                  
  //              child:ListTile(
  //                title: Text('${snapshot.data.documents[index]['email']}',
  //                style: TextStyle(fontSize: 20.0,color: Colors.black),),
  //                leading: CircleAvatar(
  //                  backgroundColor: Colors.green,
  //                  foregroundColor: Colors.black,
  //                ),
  //              ),
                
               
  //              elevation: 6.0,  
  //              color: Colors.white,   
  //                      ),
  //               ),
                 
  //             );
  //          } ,
  //        ),
  //        );
         
  //      },
  //    );
 