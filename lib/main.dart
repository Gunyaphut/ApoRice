import 'package:aporice/widget/authen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
         //ปิดริบบิ้นบนขวาหน้าจอ
      debugShowCheckedModeBanner: false,
   

      home: Authen(),
    );
  }
}
