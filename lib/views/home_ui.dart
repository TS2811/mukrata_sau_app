// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mukrata_sau_app/views/about_ui.dart';
import 'package:mukrata_sau_app/views/calculate_pay_bill_ui.dart';
import 'package:mukrata_sau_app/views/menu_shop_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _currentIndex = 1;
  List _showUI = [
    CalculatePayBillUI(),
    MenuShopUI(),
    AboutUI(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 173, 38, 38),
        centerTitle: true,
        title: Text(
          'Tech SAU BUFFET',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        initialActiveIndex: _currentIndex,
        backgroundColor: Color.fromARGB(255, 173, 38, 38),
        items: [
          TabItem(
            icon: Icon(
              FontAwesomeIcons.moneyBillWave,
              color: Color.fromARGB(255, 252, 94, 94),
            ),
            title: 'คิดเงิน',
          ),
          TabItem(
            icon: Icon(
              FontAwesomeIcons.house,
              color: Color.fromARGB(255, 252, 94, 94),
            ),
            title: 'Home',
          ),
          TabItem(
            icon: Icon(
              Icons.star_rate_rounded,
              color: Color.fromARGB(255, 252, 94, 94),
            ),
            title: 'เกี่ยวกับ',
          ),
        ],
      ),
      body: _showUI[_currentIndex],
    );
  }
}
