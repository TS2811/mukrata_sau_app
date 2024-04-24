// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_final_fields, sort_child_properties_last, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mukrata_sau_app/views/show_pay_bill_ui.dart';

class CalculatePayBillUI extends StatefulWidget {
  const CalculatePayBillUI({super.key});

  @override
  State<CalculatePayBillUI> createState() => _CalculatePayBillUIState();
}

class _CalculatePayBillUIState extends State<CalculatePayBillUI> {
  List<String> _memberType = [
    'ไม่เป็นสมาชิก',
    'สมาชิก Silver Member ลด 5%',
    'สมาชิก Gold Member ลด 10%',
    'สมาชิก Platinum Member ลด 20%',
  ];

  String _memberTypeSelected = 'ไม่เป็นสมาชิก';

  File? _imageFromCamera;

  Future openImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    setState(() {
      _imageFromCamera = File(image.path);
    });
  }

  bool _abultStatus = false;
  bool _babyStatus = false;

  int _wsterStatus = 0;

  TextEditingController _adultCtrl = TextEditingController(text: '0');
  TextEditingController _babyCtrl = TextEditingController(text: '0');
  TextEditingController _cokeCtrl = TextEditingController(text: '0');
  TextEditingController _pureCtrl = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 50.0,
            right: 50.0,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    openImageFromCamera();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: _imageFromCamera == null
                            ? AssetImage(
                                'assets/images/camera.jpg',
                              )
                            : FileImage(
                                File(
                                  _imageFromCamera!.path,
                                ),
                              ) as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนคน',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _abultStatus,
                      onChanged: (ParamValue) {
                        setState(() {
                          _abultStatus = ParamValue!;
                        });
                      },
                    ),
                    Text(
                      'ผู้ใหญ่ 299 บาท/คน จำนวน ',
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        enabled: _abultStatus == true,
                        controller: _adultCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '   คน',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _babyStatus,
                      onChanged: (ParamValue) {
                        setState(() {
                          _babyStatus = ParamValue!;
                        });
                      },
                    ),
                    Text(
                      'เด็ก 69 บาท/คน จำนวน ',
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        enabled: _babyStatus == true,
                        controller: _babyCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '   คน',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'บุปเฟต์น้ำดื่ม',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _wsterStatus,
                      onChanged: (ParamValue) {
                        setState(() {
                          _wsterStatus = ParamValue!;
                        });
                      },
                    ),
                    Text(
                      'รับ 25 บาท/หัว',
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: 2,
                      groupValue: _wsterStatus,
                      onChanged: (ParamValue) {
                        setState(() {
                          _wsterStatus = ParamValue!;
                        });
                      },
                    ),
                    Text(
                      'ไม่รับ',
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                    ),
                    Text(
                      'โค้ก 20 บาท/ขวด จำนวน ',
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        enabled: _wsterStatus == 2,
                        controller: _cokeCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        '   ขวด',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.12,
                    ),
                    Text(
                      'น้ำเปล่า 15 บาท/ขวด จำนวน ',
                    ),
                    Expanded(
                      child: TextField(
                        enabled: _wsterStatus == 2,
                        controller: _pureCtrl,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    Text(
                      '   ขวด',
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ประเภทสมาชิก',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.045,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 173, 38, 38),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: DropdownButton(
                    isExpanded: true,
                    underline: Container(),
                    onChanged: (ParamValue) {
                      setState(() {
                        _memberTypeSelected = ParamValue!;
                      });
                    },
                    value: _memberTypeSelected,
                    items: _memberType
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(
                              e,
                            ),
                            value: e,
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: ElevatedButton.icon(
                        onPressed: (_abultStatus == true || _babyStatus == true) && _wsterStatus > 0 ? () {
                          double _adultPay = _abultStatus == false
                              ? 0
                              : (int.parse(_adultCtrl.text) * 299);
                          double _babyPay = _babyStatus == false
                              ? 0
                              : (int.parse(_babyCtrl.text) * 69);
                          double _waterPay = _wsterStatus == 1
                              ? (int.parse(_adultCtrl.text) +
                                      int.parse(_babyCtrl.text)) *
                                  25
                              : 0;
                          double _cokePay = int.parse(_cokeCtrl.text) * 20;
                          double _purePay = int.parse(_pureCtrl.text) * 15;
                          double _totalPay = _adultPay +
                              _babyPay +
                              _waterPay +
                              _cokePay +
                              _purePay;
                          if (_memberTypeSelected == 'ไม่เป็นสมาชิก') {
                            _totalPay = _totalPay;
                          } else if (_memberTypeSelected ==
                              'สมาชิก Silver Member ลด 5%') {
                            _totalPay = _totalPay - (_totalPay * 0.05);
                          } else if (_memberTypeSelected ==
                              'สมาชิก Gold Member ลด 10%') {
                            _totalPay = _totalPay - (_totalPay * 0.1);
                          } else {
                            _totalPay = _totalPay - (_totalPay * 0.2);
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowPayBillUI(
                                adult: _adultCtrl.text,
                                baby: _babyCtrl.text,
                                water: _wsterStatus,
                                coke: _cokeCtrl.text,
                                pure: _pureCtrl.text,
                                memberType: _memberTypeSelected,
                                totalPay: _totalPay,
                                imageFile: _imageFromCamera,
                              ),
                            ),
                          );
                        } : null,
                        icon: Icon(
                          FontAwesomeIcons.moneyBillWave,
                          color: Colors.white,
                        ),
                        label: Text(
                          'คำนวนเงิน',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 173, 38, 38),
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.5,
                            MediaQuery.of(context).size.height * 0.05,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            _abultStatus = false;
                            _babyStatus = false;
                            _adultCtrl = TextEditingController(text: '0');
                            _babyCtrl = TextEditingController(text: '0');
                            _cokeCtrl = TextEditingController(text: '0');
                            _pureCtrl = TextEditingController(text: '0');
                            _wsterStatus = 0;
                            _imageFromCamera = null;
                            _memberTypeSelected = 'ไม่เป็นสมาชิก';
                          });
                        },
                        icon: Icon(
                          Icons.cancel_rounded,
                          color: Colors.white,
                        ),
                        label: Text(
                          'ยกเลิก',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 78, 74, 74),
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.5,
                            MediaQuery.of(context).size.height * 0.05,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
