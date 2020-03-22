import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:aporice/utility/normal_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Field  ใช้ในการประกาศตัวแปล
  File file;
  String name, user, password, urlPath;

  // Method

  Widget nameForm() {
    Color color = Colors.orange.shade900;
    String title = 'name :';
    String help = 'Type Your Name in Blank';
    return TextField(
      onChanged: (value) => name = value.trim(),
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color)),
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
      onChanged: (value) => user = value.trim(),
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color)),
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
      onChanged: (value) => password = value.trim(),
      decoration: InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: color)),
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
    return GestureDetector(
      onTap: () {
        print('You Click Image');
        cameraThread();
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        child:
            file == null ? Image.asset('images/logo2.png') : Image.file(file),
      ),
    );
  }

  Future<void> cameraThread() async {
    try {
      var object = await ImagePicker.pickImage(
        source: ImageSource.camera,
        maxWidth: 800.0,
        maxHeight: 800.0,
      );

      setState(() {
        file = object;
      });
    } catch (e) {}
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
      onPressed: () {
        if (file == null) {
          normalDialog(
              context, 'Non choose Avatar ไม่มีรูปภาพ', 'กรุณาเปิดกล้อง');
        } else if (name == null ||
            name.isEmpty ||
            user == null ||
            user.isEmpty ||
            password == null ||
            password.isEmpty) {
          normalDialog(context, 'มีช่องว่าง', 'กรุณาใส่ข้อความ');
        } else {
          uplodeImageToServer();
        }
      },
    );
  }

//ตัวอย่างการอัพโหลดรูปไป  เซิฟเวอร์
  Future<void> uplodeImageToServer() async {
    try {
      String url = 'https://www.androidthai.in.th/rice/saveFileApo.php';

      Map<String, dynamic> map = Map();

      Random random = Random();
      int i = random.nextInt(100000);

      //การสั่งให้อัพโหลดรูปภาพขึ้นเซิร์ฟ

      map['file'] = UploadFileInfo(file, 'user$i.jpg');
      FormData formData = FormData.from(map);

      //var response = await Dio().post(url, data: ชื่อที่มาจากเซิฟอาหาร);
      var response = await Dio().post(url, data: formData);
      print('response = ${response.toString()}');

     urlPath = 'https://www.androidthai.in.th/rice/Apo/user$i.jpg';
     insertDataToMySQL();

    } catch (e) {
      print('error ==> ${e.toString()}');
    }
  }

  Future<void> insertDataToMySQL()async{

try {
  String url = 'https://www.androidthai.in.th/rice/addUserApo.php?isAdd=true&Name=$name&User=$user&Password=$password&Avatar=$urlPath';
  var response = await Dio().get(url);

  if (response.toString()== 'true') {
    Navigator.of(context).pop();
    
  } else {
    normalDialog(context,'Cannot Register', 'Please Try Agains กรุณาอีกครั้ง');
  }

} catch (e) {
}

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
