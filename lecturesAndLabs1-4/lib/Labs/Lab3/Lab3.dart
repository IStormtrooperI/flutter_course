import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //to close window
  bool isOpened = true;

  //to change shapes
  bool isCircle = true;

  //to change logo
  int stepOfLogo = 0;

  //to hide Fav
  bool isLock = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(
          'Lab 3',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: AnimatedContainer(
        margin: EdgeInsets.all(20),
        duration: Duration(milliseconds: 450),
        width: screenWidth,
        height: isOpened == true ? screenHeight : 60,
        color: Colors.indigo,
        child: Stack(
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16),
              color: Colors.yellow,
              child: InkWell(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                      'Click to Expand',
                      style: TextStyle(fontSize: 18),
                    )),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isOpened = !isOpened;
                        });
                      },
                      child: Icon(Icons.keyboard_arrow_down),
                      splashColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    changeShapes(screenWidth),
                    flutterChanger(screenWidth),
                    showHide(screenWidth),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget changeShapes(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white,
            width: width,
            height: 150,

            /// ********** Do changes in child below ********** ///
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isCircle == true ? isCircle = false : isCircle = true;
                    });
                  },
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: isCircle == true ? Colors.blue : Colors.red,
                        shape: isCircle == true
                            ? BoxShape.circle
                            : BoxShape.rectangle,
                      )),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isCircle == true ? isCircle = false : isCircle = true;
                    });
                  },
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: isCircle == true ? Colors.red : Colors.blue,
                        shape: isCircle == true
                            ? BoxShape.rectangle
                            : BoxShape.circle,
                      )),
                ),
              ],
            ))),
      ),
    );
  }

  Widget flutterChanger(double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white,
            width: width,
            height: 150,

            /// ********** Do changes in child below ********** ///
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          FlutterLogo(
                            size: stepOfLogo == 0
                                ? 100
                                : stepOfLogo == 1
                                    ? 30
                                    : 70,
                          ),
                          Text(
                            "Flutter",
                            style: TextStyle(
                              fontSize: stepOfLogo == 0
                                  ? 0
                                  : stepOfLogo == 1
                                      ? 20
                                      : 0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Flutter",
                        style: TextStyle(
                          fontSize: stepOfLogo == 0
                              ? 0
                              : stepOfLogo == 1
                                  ? 0
                                  : 30,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        stepOfLogo == 0
                            ? stepOfLogo = 1
                            : stepOfLogo == 1
                                ? stepOfLogo = 2
                                : stepOfLogo = 0;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.purple,shape: BoxShape.circle),
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.autorenew,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget showHide(double width) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.white,
            width: width,
            height: 150,

            /// ********** Do changes in child below ********** ///
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: isLock == true ? 100 : 0,
                ),
                InkWell(
                  onTap: (){
                    setState(() {
                      isLock == true ? isLock = false : isLock = true;
                    });
                  },
                  child: Icon(
                    isLock == true ? Icons.lock_outline : Icons.lock_open,
                    color: Colors.deepPurple,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
