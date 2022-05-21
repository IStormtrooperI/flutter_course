import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.favorite),
        title: const Text('flutter ;c main lib'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: myWidget(),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget myWidget() {
    return Container(
      child:
          /*******************--[focus here 🧐]--*******************/
      L4Exercise1(),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  //region Lecture 1
  Widget elevatedButtonQuizSolution() {
    return ElevatedButton(
      child: const Text(
        "Press me",
        style: TextStyle(
          color: Colors.yellowAccent,
          fontFamily: 'casual',
          fontSize: 16,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        shape: StadiumBorder(),
      ),
      onPressed: () {
        print("press me");
      },
    );
  }

  Widget IconQuizMySolution() {
    return const Icon(
      Icons.whatshot,
      color: Colors.red,
      size: 200,
      textDirection: TextDirection.rtl,
    );
  }

  Widget textImam() {
    return const Text('Your first Quiz',
        style: TextStyle(
          color: Colors.cyan,
          backgroundColor: Colors.yellow,
          fontSize: 50,
          fontFamily: 'casual',
          fontStyle: FontStyle.italic,
        ));
  }

  Widget textQuizMySolution() {
    return const Text(
      'Your first Quiz',
      style: TextStyle(
          fontSize: 40,
          color: Colors.green,
          fontFamily: 'casual',
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300,
          letterSpacing: 4,
          backgroundColor: Colors.yellowAccent),
    );
  }

//endregion

  //region Lecture 2
  Widget exercise1() {
    return Image.asset(
      "assets/stormtrooper 184x184.png",
      height: 400,
      width: 200,
      fit: BoxFit.cover,
    );
  }

  Widget exercise2QuizSolution() {
    return Image.network(
      "https://s1.1zoom.ru/b5050/297/Canada_Mountains_Scenery_488936_3840x2400.jpg",
      fit: BoxFit.cover,
    );
  }

  Widget exercise3() {
    return IconButton(
      onPressed: () {
        print("pressed");
      },
      splashColor: Colors.yellowAccent,
      icon: Icon(Icons.add),
      iconSize: 100,
      padding: EdgeInsets.all(16),
    );
  }

  Widget exercise4() {
    return Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
        shape: BoxShape.rectangle,
      ),
      padding: EdgeInsets.only(top: 100, left: 30),
      margin: EdgeInsets.only(top: 100, left: 30),
      child: Text(
        "Hello Container",
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  Widget exercise5QuizSolution() {
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFF6f43ff),
        border: Border.all(
          color: Colors.black,
          width: 6,
        ),
        shape: BoxShape.rectangle,
      ),
      padding: EdgeInsets.only(top: 25, left: 40),
      child: Text(
        "Quiz Container",
        style: TextStyle(
            fontSize: 30, fontFamily: 'casual', fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget exercise6() {
    return Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(
            color: Colors.black,
            width: 3,
          ),
          shape: BoxShape.rectangle,
        ),
        child: Text(
          "Hello Container",
          style: TextStyle(fontSize: 30, fontFamily: 'casual'),
        ));
  }

  Widget exercise7() {
    return Padding(
      padding: const EdgeInsets.all(100.0),
      child: Icon(
        Icons.done,
        size: 100,
      ),
    );
  }

  Widget exercise8QuizSolution() {
    return Container(
      color: Colors.yellow,
      height: 400,
      child: Center(
        child: Icon(
          Icons.done,
          size: 100,
          color: Colors.red,
        ),
      ),
    );
  }

//endregion

  //region Lecture 3
  Widget L3Exercise1() {
    return Container(
        padding: EdgeInsets.all(8),
        child: Container(
          height: 300,
          color: Colors.teal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.ltr,
            children: const [
              Icon(
                Icons.whatshot,
                color: Colors.deepOrangeAccent,
                size: 30,
              ),
              Text("What is Hot!"),
            ],
          ),
        ));
  }

  Widget L3Exercise2QuizSolution() {
    return Container(
        padding: EdgeInsets.all(8),
        child: Container(
          height: 300,
          color: Color(0xFF55717f),
          padding: EdgeInsets.only(bottom: 16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Icon(
                Icons.share,
                color: Color(0xFF19e8e8),
                size: 40,
              ),
              Icon(
                Icons.message,
                color: Color(0xFF56d594),
                size: 40,
              ),
              Icon(
                Icons.favorite,
                color: Color(0xFFe9c033),
                size: 40,
              ),
              Icon(
                Icons.delete,
                color: Color(0xFFe84240),
                size: 40,
              ),
            ],
          ),
        ));
  }

  Widget L3Exercise3() {
    return Container(
        child: Container(
            height: 300,
            width: 300,
            color: Colors.blueGrey,
            padding: EdgeInsets.only(bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.share,
                  color: Colors.lightBlueAccent,
                  size: 50,
                ),
                Icon(
                  Icons.share,
                  color: Colors.lightBlueAccent,
                  size: 50,
                ),
                Icon(
                  Icons.share,
                  color: Colors.lightBlueAccent,
                  size: 50,
                ),
              ],
            )));
  }

  Widget L3Exercise4QuizSolution() {
    return Container(
        child: Container(
            height: 300,
            padding: EdgeInsets.only(bottom: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  "I",
                  style: TextStyle(fontSize: 50, color: Colors.redAccent),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 50,
                ),
                Text(
                  "Flutter",
                  style: TextStyle(fontSize: 50, color: Colors.blueAccent),
                ),
                FlutterLogo(
                  size: 100,
                ),
              ],
            )));
  }

//endregion

  //region Lecture 4
  Widget L4Exercise1() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Text("1"),
                color: Colors.red,
                width: 300,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Text("2"),
                color: Colors.yellow,
                width: 300,
              ),
            ),
            Expanded(
              child: Container(
                child: Text("3"),
                color: Colors.green,
                width: 300,
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: Text("4"),
                color: Colors.blueGrey,
                width: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget L4Exercise2() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Container(
        padding: EdgeInsets.only(bottom: 16),
        child: Scrollbar(
          thickness: 6,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  size: 100,
                ),
                Icon(
                  Icons.add,
                  size: 100,
                ),
                Icon(
                  Icons.add,
                  size: 100,
                ),
                Icon(
                  Icons.add,
                  size: 100,
                ),
                Icon(
                  Icons.add,
                  size: 100,
                ),
                Icon(
                  Icons.add,
                  size: 100,
                ),
                Icon(
                  Icons.add,
                  size: 100,
                ),
                Icon(
                  Icons.add,
                  size: 100,
                ),
                Icon(
                  Icons.add,
                  size: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget L4Exercise3() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      height: 500,
      color: Colors.black12,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.greenAccent,
                  child: Text("Hello"))),
          Align(
              alignment: Alignment.center,
              child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                  child: Text("Hi"))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.blueAccent,
                  child: Text("Hi"))),
        ],
      ),
    );
  }

  Widget L4Exercise4Quiz() {
    return Container(
      margin: EdgeInsets.all(8),
      height: 200,
      color: Colors.black12,
      child: Stack(
        children: [
          Image.network(
            "https://wallpaperaccess.com/full/428690.jpg",
            height: 200,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Sunrise",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "casual",
                color: Colors.white,
                backgroundColor: Colors.black45,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget L4Exercise5() {
    return Container(
        margin: EdgeInsets.all(8),
        height: 200,
        color: Colors.black12,
        child: Wrap(
          spacing: 30,
          children: const [
            Icon(
              Icons.access_time,
              size: 100,
            ),
            Icon(
              Icons.calendar_today,
              size: 100,
            ),
            Icon(
              Icons.calendar_today_outlined,
              size: 100,
            ),
            Icon(
              Icons.calendar_today_outlined,
              size: 100,
            ),
            Icon(
              Icons.calendar_today_outlined,
              size: 100,
            ),
            Icon(
              Icons.calendar_today_outlined,
              size: 100,
            ),
            Icon(
              Icons.calendar_today_outlined,
              size: 100,
            ),
          ],
        ));
  }

  Widget L4Exercise6Quiz() {
    return Container(
        margin: EdgeInsets.all(8),
        color: Colors.black12,
        child: Wrap(
          spacing: 30,
          children: [
            Image.network(
              "https://wallpaperaccess.com/full/428690.jpg",
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
            Image.network(
              "https://wallpaperaccess.com/full/428690.jpg",
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
            Image.network(
              "https://wallpaperaccess.com/full/428690.jpg",
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
            Image.network(
              "https://wallpaperaccess.com/full/428690.jpg",
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ));
  }

  Widget L4Exercise7() {
    return Container(
        margin: EdgeInsets.all(8),
        color: Colors.black12,
        child: Wrap(
          spacing: 30,
          children: [
            AspectRatio(
              aspectRatio: 16/9,
              child: Image.network(
                "https://wallpaperaccess.com/full/428690.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "Sunrise",
              style: TextStyle(fontSize: 100, fontFamily: "cursive"),
            )
          ],
        ));
  }

//endregion



}
