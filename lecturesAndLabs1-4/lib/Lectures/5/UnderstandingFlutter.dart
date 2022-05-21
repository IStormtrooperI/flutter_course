import 'package:flutter/material.dart';

void main() {
  // stateful and stateless widgets

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
          accentColor: Colors.deepOrangeAccent,
        ),
      ),
      home: MyAppHome(),
    );
  }
}

class MyAppHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () { print("hello"); },),
      appBar: AppBar(
        title: Icon(Icons.android),
        leading: Text("hello"),
      ),
      body: myWidget(),
    );
  }

  myWidget(){
    return Text('hello ');
  }
}

class MySecondWidget extends StatelessWidget {
  const MySecondWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hello', style: TextStyle(fontSize: 50, color: Colors.grey,),),
        Text('Hello', style: TextStyle(fontSize: 50, color: Colors.grey,),),
        FlutterLogo(size: 200, style: FlutterLogoStyle.horizontal,),
      ],
    );
  }
}
