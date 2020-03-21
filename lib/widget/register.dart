import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Field

  // Method

  Widget nameForm() {
    Color color = Colors.orange.shade900;
    String title = 'name :';
    String help = 'Type Your Name in Blank';
    return TextField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: color)),
        helperStyle: TextStyle(color: color),
        helperText: help,
        labelStyle: TextStyle(color: color),
        labelText: title,
        icon: Icon(
          Icons.account_box,
          size: 36.0,
          color: color,
        ),
      ),
    );
  }

  Widget userForm() {
    Color color = Colors.orange.shade600;
    String title = 'username :';
    String help = 'Type Your userName in Blank';
    return TextField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: color)),
        helperStyle: TextStyle(color: color),
        helperText: help,
        labelStyle: TextStyle(color: color),
        labelText: title,
        icon: Icon(
          Icons.account_box,
          size: 36.0,
          color: color,
        ),
      ),
    );
  }

  Widget passwordForm() {
    Color color = Colors.orange.shade300;
    String title = 'password :';
    String help = 'Type Your password in Blank';
    return TextField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: color)),
        helperStyle: TextStyle(color: color),
        helperText: help,
        labelStyle: TextStyle(color: color),
        labelText: title,
        icon: Icon(
          Icons.account_box,
          size: 36.0,
          color: color,
        ),
      ),
    );
  }

  Widget showAvartar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: Image.asset('images/logo2.png'),
    );
  }

  Widget registerButton() {
    // สร้างก้อนเมฆ
    return IconButton(
      icon: Icon(Icons.android),
      onPressed: () {},
    );
  }

  Widget registerButton2() {
    // สร้างก้อนเมฆ
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  Widget registerButton3() {
    // สร้างก้อนเมฆ
    return IconButton(
      icon: Icon(Icons.fingerprint),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(40.0),
        children: <Widget>[
          showAvartar(),
          nameForm(),
          userForm(),
          passwordForm(),
        ],
      ),
      appBar: AppBar(
        actions: <Widget>[
          registerButton3(),
          registerButton2(),
          registerButton()
        ],
        title: Text('Register'),
        backgroundColor: Colors.orange.shade700,
      ),
    );
  }
}
