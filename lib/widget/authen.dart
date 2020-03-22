import 'dart:convert';

import 'package:aporice/utility/normal_dialog.dart';
import 'package:aporice/widget/my_service.dart';
import 'package:aporice/widget/register.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Field
  String user, password;

  // method
  Widget singInButton() {
    return RaisedButton(
      color: Colors.brown.shade700,
      child: Text('Sign IN'),
      onPressed: () {
        if (user == null ||
            user.isEmpty ||
            password == null ||
            password.isEmpty) {
          normalDialog(
              context, 'Cannot Register มีช่องว่าง', 'กรุณากรอกทุกช่อง');
        } else {
          checkAuthen();
        }
      },
    );
  }

  Future<void> checkAuthen() async {
    try {
      String url =
          'https://www.androidthai.in.th/rice/getUserWhereUserApo.php?isAdd=true&User=$user';
      var response = await Dio().get(url);
      print('response ===>> $response');

      if (response.toString() == 'null') {
        normalDialog(context, 'User False', 'No $user in My Database');
      } else {
        // คือการแปลงภาษาโคตให้เป็นภาษาไทย
        var resule = json.decode(response.data);
        print('result ==>> $resule');

//เพราะติดสแควบัคเก็ต[] ต้องทำการปรดออกไป
        for (var map in resule) {
          //ทำเพื่อ ส่งค่าไปอีกหน้า
          String truePassword = map['Password'];
          String nameLogin = map['Name'];

          if (password == truePassword) {
            //คือการเร้า คือการกดแล้วไปที่ไหน
            MaterialPageRoute route = MaterialPageRoute(
              builder: (context) => MyService(
                name: nameLogin,
              ),
            );
            //เมื่อกดไปแล้ว ห้ามกลับ กรณ ตัวอย่างเช่น Login
            Navigator.of(context).pushAndRemoveUntil(route, (value) => false);
          } else {
            normalDialog(context, 'พาสผิด', 'กรุณาใส่รหัสใหม่');
          }
        }
      }
    } catch (e) {}
  }

  Widget singUpButton() {
    return OutlineButton(
      child: Text('Sign UP'),
      onPressed: () {
        //เชื่อมให้ตัดไปอีกหน้า วิธีการทำเร้า
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Register());
            //เมื่อกดแล้วกดกลับหน้าเดิมได้
        Navigator.of(context).push(route);
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        singInButton(),
        mySizeBox(),
        singUpButton(),
      ],
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      height: 16.0,
      width: 5.0,
    );
  }

  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextField(
        onChanged: (value) => user = value.trim(),
        decoration: InputDecoration(
          labelText: 'User:',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget passWord() {
    return Container(
      width: 250.0,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: true, //ใช้เปิดปิดพาสเวิดให้เป็นจุดๆ
        decoration: InputDecoration(
          labelText: 'Password:',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget showAppName() {
    return Text(
      'Apo G',
      style: GoogleFonts.balooTammudu(
          textStyle: TextStyle(
        color: Colors.brown.shade700,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontSize: 50.0,
      )),
    );
  }

  Widget showLogo() {
    return Container(
      width: 100.0,
      child: Image.asset('images/logo.png'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //แรปcenter เพื่อใส่สีพื้นหลัง
        decoration: BoxDecoration(
          //สร้างไล่สีพื้นหลัง
          gradient: RadialGradient(
              colors: <Color>[Colors.white, Colors.orange.shade700],
              radius: 1.0,
              center: Alignment(0, -0.3)),
        ),
        child: Center(
          child: SingleChildScrollView(
            //แก้บักเพื่อไม่ให้ขึ้นแถบเหลือง
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
                showAppName(),
                mySizeBox(),
                userForm(),
                mySizeBox(),
                passWord(),
                mySizeBox(),
                showButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
