// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';

class MenuShopUI extends StatefulWidget {
  const MenuShopUI({super.key});

  @override
  State<MenuShopUI> createState() => _MenuShopUIState();
}

class _MenuShopUIState extends State<MenuShopUI> {
  List<String> _showMenu = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/img6.png',
    'assets/images/img7.png',
  ];

  List<String> _showShop = [
    'assets/images/shop1.png',
    'assets/images/shop2.png',
    'assets/images/shop3.png',
    'assets/images/shop4.png',
    'assets/images/shop5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.5,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'เมนูเด็ด',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.015,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              height: 100.0,
              padding: EdgeInsets.only(
                left: 30.0,
                right: 30.0,
              ),
              child: ListView.builder(
                itemCount: _showMenu.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        _showMenu[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'ร้านในเครือ',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.015,
                color: const Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _showShop.length,
                //scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        _showShop[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
