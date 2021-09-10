import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  _AboutMeScreenState createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
  var date;
  var cmheight = 50;
  var ftheight = 5.0;
  var kgweight = 50;
  var pweight = 100;
  bool feetSelected = false;
  bool cmSelected = true;
  bool kgSelected = false;
  bool poundSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // #ff5a5a
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Icon(
              Icons.arrow_back_ios,
              color: Color(0XFFff5a5a),
              size: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.01,
            ),
            Text(
              'About Me',
              style: TextStyle(
                color: Color(0XFFff5a5a),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'DOB',
                    style: TextStyle(
                        color: Color(0XFFff5a5a),
                        fontWeight: FontWeight.bold,
                        fontSize: 19),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                      barBackgroundColor: Colors.white,
                      primaryColor: Colors.white,
                      textTheme: CupertinoTextThemeData(
                        dateTimePickerTextStyle: TextStyle(
                          color: Color(0XFFff5a5a),
                          fontSize: 16,
                        ),
                      ),
                    ),
                    child: CupertinoDatePicker(
                        minimumYear: 1920,
                        maximumYear: DateTime.now().year,
                        mode: CupertinoDatePickerMode.date,
                        backgroundColor: Colors.white,
                        onDateTimeChanged: (val) {
                          date = val;
                          // print(date);
                        }),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Height',
                        style: TextStyle(
                            color: Color(0XFFff5a5a),
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            feetSelected = !feetSelected;
                            cmSelected = !cmSelected;
                          });
                        },
                        child: Text(
                          'Feet',
                          style: TextStyle(
                              color: feetSelected
                                  ? Colors.white
                                  : Color(0XFFff5a5a),
                              fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: feetSelected
                                      ? Colors.transparent
                                      : Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                          primary:
                              !feetSelected ? Colors.white : Color(0XFFff5a5a),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              feetSelected = !feetSelected;
                              cmSelected = !cmSelected;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: cmSelected
                                        ? Colors.transparent
                                        : Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            primary:
                                !cmSelected ? Colors.white : Color(0XFFff5a5a),
                          ),
                          child: Text(
                            'Centimeters',
                            style: TextStyle(
                                color: cmSelected
                                    ? Colors.white
                                    : Color(0XFFff5a5a),
                                fontSize: 15),
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              cmSelected
                  ? NumberPicker(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFff5a5a)),
                          borderRadius: BorderRadius.circular(10)),
                      selectedTextStyle: TextStyle(
                          color: Color(0XFFff5a5a),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      axis: Axis.horizontal,
                      value: cmheight,
                      minValue: 10,
                      maxValue: 500,
                      onChanged: (newValue) =>
                          setState(() => cmheight = newValue))
                  : DecimalNumberPicker(
                      decimalDecoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFff5a5a)),
                          borderRadius: BorderRadius.circular(10)),
                      integerDecoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFff5a5a)),
                          borderRadius: BorderRadius.circular(10)),
                      selectedTextStyle: TextStyle(
                          color: Color(0XFFff5a5a),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      axis: Axis.horizontal,
                      value: ftheight,
                      minValue: 0,
                      maxValue: 20,
                      onChanged: (double newValue) =>
                          setState(() => ftheight = newValue)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              feetSelected
                  ? Text(
                      'Selected Height: ${ftheight.toString()} feets',
                      style: TextStyle(fontSize: 15, color: Color(0XFFff5a5a)),
                    )
                  : Text(
                      'Selected Height: ${cmheight.toString()} cm',
                      style: TextStyle(fontSize: 15, color: Color(0XFFff5a5a)),
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Weight',
                        style: TextStyle(
                            color: Color(0XFFff5a5a),
                            fontWeight: FontWeight.bold,
                            fontSize: 19),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            kgSelected = !kgSelected;
                            poundSelected = !poundSelected;
                          });
                        },
                        child: Text(
                          'Kg',
                          style: TextStyle(
                              color:
                                  kgSelected ? Colors.white : Color(0XFFff5a5a),
                              fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: kgSelected
                                      ? Colors.transparent
                                      : Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                          primary:
                              !kgSelected ? Colors.white : Color(0XFFff5a5a),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              kgSelected = !kgSelected;
                              poundSelected = !poundSelected;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: poundSelected
                                        ? Colors.transparent
                                        : Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            primary: !poundSelected
                                ? Colors.white
                                : Color(0XFFff5a5a),
                          ),
                          child: Text(
                            'Pounds',
                            style: TextStyle(
                                color: poundSelected
                                    ? Colors.white
                                    : Color(0XFFff5a5a),
                                fontSize: 15),
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              kgSelected
                  ? NumberPicker(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFff5a5a)),
                          borderRadius: BorderRadius.circular(10)),
                      selectedTextStyle: TextStyle(
                          color: Color(0XFFff5a5a),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      axis: Axis.horizontal,
                      value: kgweight,
                      minValue: 20,
                      maxValue: 500,
                      onChanged: (newValue) =>
                          setState(() => kgweight = newValue))
                  : NumberPicker(
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0XFFff5a5a)),
                          borderRadius: BorderRadius.circular(10)),
                      selectedTextStyle: TextStyle(
                          color: Color(0XFFff5a5a),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      axis: Axis.horizontal,
                      value: pweight,
                      minValue: 40,
                      maxValue: 1000,
                      onChanged: (newValue) =>
                          setState(() => pweight = newValue)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              kgSelected
                  ? Text(
                      'Selected Weight: ${kgweight.toString()} Kg',
                      style: TextStyle(fontSize: 15, color: Color(0XFFff5a5a)),
                    )
                  : Text(
                      'Selected Weight: ${pweight.toString()} Pounds',
                      style: TextStyle(fontSize: 15, color: Color(0XFFff5a5a)),
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('CONFIRM'),
                style: ElevatedButton.styleFrom(
                    primary: Color(0XFFff5a5a),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
