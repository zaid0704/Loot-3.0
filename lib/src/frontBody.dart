import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../main.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
class HomePage extends StatefulWidget 
{
  @override
 createState() {
   return HomePageState();
  }
}
class HomePageState extends State<HomePage>
 {
   
  
   Widget build(BuildContext context) {
     
     return Center(
       child:Column (
         mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         Stack(
           alignment: Alignment.center,
           children: <Widget>[
            Container(
            
            width: 80.0,
            height:80.0,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(80.0),color: Colors.green),
            child:Icon(Icons.chat,color: Colors.white,size:40.0),
            ),
            Padding(
              padding: EdgeInsets.only(top:100.0,left:50.0),
              child: Container(
            
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(80.0),color: Color(0xFF3b5998)),
            child:Icon(Icons.picture_in_picture,color: Colors.white,size: 40.0,),
     ),

            ),
            Padding(
              padding: EdgeInsets.only(right:50.0,top: 100.0,),
              child: Container(
            
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(80.0),color: Color(0xFFDF5138)),
            child:Icon(Icons.video_call,color: Colors.white,size: 40.0,),
     ),

            ),
            
           ],
         ),
          Padding(
            padding:EdgeInsets.all(30.0),
            child: Text('Whattsapp',style: TextStyle(fontSize: 40.0,color: Colors.green),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Expanded(
                
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child:GestureDetector(
                    child: Container(
                height: 40.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),color:Colors.lightBlue
                ),
                child: Text('Sign In with Email',style: TextStyle(fontSize: 25.0,color: Colors.white)),
              ),  
                  
                  onTap: (){
                    Navigator.of(context).pushNamed("/loginScreen");
                  },),
                 
                ),
                ),
             
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding:EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  child:RaisedButton(
                    child: Text('Facebook'),
                    textColor: Colors.white,
                    color:Color(0xFF3b5998),
                    onPressed: (){
                      initiateFacebookLogin();
                    },
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0) ),
                    elevation: 6.0,
                    
                  ),
                ),
              ),
              // Expanded(
              //   child: Padding(
              //     padding:EdgeInsets.all(20.0),
              //     child:RaisedButton(
              //       child: Text('Google'),
              //       textColor: Colors.white,
              //       color:Color(0xFFDF5138),
              //       onPressed: (){},
              //       shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0) ),
              //       elevation: 6.0,
                    
              //     ),
              //   ),
              // )
               
            ],
          ),
          Row(
            
            
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding:EdgeInsets.only(left: 20.0,right: 20.0),
                  child:RaisedButton(
                    child: Text('Login'),
                    textColor: Colors.white,
                    color:Color(0xFF3b5998),
                    onPressed: (){
                     Navigator.of(context).pushNamed("/loginUser");
                                           },
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0) ),
                    elevation: 6.0,
                    
                  ),
                ),
              ),
            ],
          ),
          
       ],
     )
     
     );
        } 
       void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
   // var facebookLoginResult =
        await facebookLogin.logInWithReadPermissions(['email']);
    //  switch (facebookLoginResult.status) {
    //   case FacebookLoginStatus.error:
    //     print("Error");
    //     onLoginStatusChanged(false);
    //     break;
    //   case FacebookLoginStatus.cancelledByUser:
    //     print("CancelledByUser");
    //     onLoginStatusChanged(false);
    //     break;
    //   case FacebookLoginStatus.loggedIn:
    //     print("LoggedIn");
    //     onLoginStatusChanged(true);
    //     break;
    // }
  }
        }
 Widget TextFeild()
  {
    return new TextField(
  // onChanged: ...,
  // decoration: ...,
  
  autofocus: true,
  decoration: new InputDecoration(
    counterText: "100",
    filled: true, 
    fillColor: Colors.grey[300], 
    hintText: 'This is a hint'),

);
  }