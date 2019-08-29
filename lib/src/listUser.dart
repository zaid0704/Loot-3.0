import 'package:flutter/material.dart';
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
        ),),);

  }
}