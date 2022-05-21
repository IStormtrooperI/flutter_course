import 'package:flutter/material.dart';

void main() => runApp(Lab1());

/// this is your APP Main screen configuration
class Lab1 extends StatelessWidget {
  Lab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LAb1HomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class LAb1HomePage extends StatelessWidget {
  LAb1HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.stars),
        title: const Text('Lab 1'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: myWidget(),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget myWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          /*******************--[focus here 🧐]--*******************/
          SizedBox(
            height: 25,
          ),
          exercise1(),
          SizedBox(
            height: 25,
          ),
          exercise2(),
          SizedBox(
            height: 25,
          ),
          exercise3(),
          SizedBox(
            height: 25,
          ),
          exercise4(),
          SizedBox(
            height: 25,
          ),
          exercise5(),
          /*******************--[focus here 🧐]--*******************/
        ],
      ),
    );
  }

  /// TODO: Implement Exercises below as per the handed Document
  Widget exercise1() {
    return const Text('Welcome to lab1 ',
        style: TextStyle(
          color: Color(0xFF6deeb0),
          backgroundColor: Color(0xFF999597),
          fontSize: 25,
          fontFamily: 'monospace',
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w700,
        ));
  }

  Widget exercise2() {
    return const Icon(
      Icons.share,
      color: Color(0xFF1d98f8),
      size: 150,
      textDirection: TextDirection.rtl,
    );
  }

  /// TODO : print on the screen on Pressed when clicking on the button, and print on Long Pressed when long click to Button
  Widget exercise3() {
    return ElevatedButton(
      child: const Text(
        "Click here",
        style: TextStyle(
          color: Color(0xFFebdf57),
          fontSize: 20,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        shape: StadiumBorder(),
        backgroundColor: Color(0xFF536dfe),
      ),
      onPressed: () {
        print("on Pressed");
      },
      onLongPress: () {
        print("Long Pressed");
      },
    );
  }

  Widget exercise4() {
    return ElevatedButton(
      child: Icon(
        Icons.favorite,
        color: Color(0xFF6de7ae),
        size: 30,
        textDirection: TextDirection.rtl,
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
        backgroundColor: Colors.black,
        shape: CircleBorder(),
      ),
      onPressed: () {
        print("press me");
      },
    );
  }

  Widget exercise5() {
    return OutlinedButton(
      child: Text("Button to press",
          style: TextStyle(
            color: Color(0xFFee6d4d),
            fontSize: 25,
          )),
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
          side: BorderSide(color: Colors.amber, width: 2)),
      onPressed: () {
        print("press me");
      },
    );
  }
}
