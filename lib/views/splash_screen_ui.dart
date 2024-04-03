// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mukrata_sau_app/views/home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // โค้ตหน่วงเวลา...
    Future.delayed(
      //เวลาที่หน่วง
      Duration(
        seconds: 5,
      ),
      //เมื่อครบเวลาแล้วจะให้ทำอะไร
      //ในที่นี้จะให้เปิดไปหน้าจอ IntrodutionUI แบบ ไม่สามารถย้อนกลับได้
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeUI(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 156, 44, 44),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.7,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            CircularProgressIndicator(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'Tech SAU BUFFET',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Copyright © 2024 by ThanawatS',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.015,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
