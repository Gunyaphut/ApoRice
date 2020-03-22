import 'package:flutter/material.dart';


//คือการโยนค่าข้ามสเตจ 
class MyService extends StatefulWidget {

  final String name;
  MyService({Key key, this.name}) : super(key: key);



  @override
  _MyServiceState createState() => _MyServiceState();
}



class _MyServiceState extends State<MyService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(title: Text('My Service'),),
      
    );
  }
}