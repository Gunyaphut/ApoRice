import 'package:aporice/widget/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Field

  // method
  Widget singInButton() {
    return RaisedButton(
      color: Colors.brown.shade700,
      child: Text('Sign IN'),
      onPressed: () {},
    );
  }

  Widget singUpButton() {
    return OutlineButton(
      child: Text('Sign UP'),
      onPressed: () {
        //เชื่อมให้ตัดไปอีกหน้า วิธีการทำเร้า 
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => Register());
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
