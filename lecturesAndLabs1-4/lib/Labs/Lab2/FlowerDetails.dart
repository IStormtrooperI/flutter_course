import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // to change your app color change this
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text(
            'Flower Shop',
            style: TextStyle(fontFamily: 'casual'),
          ),
          /*******************--[focus here 🧐]--*******************/
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            /*******************--[focus here 🧐]--*******************/
            flowerDetails(context),
          ],
        ));
  }
}

Widget flowerDetails(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(20),
    color: Colors.amber,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        imageGroup(),
        titleGroup(),
        iconGroup(),
        textGroup(),
        buttonGroup(),
      ],
    ),
  );
}

/// Image URL
/// https://newevolutiondesigns.com/images/freebies/yellow-wallpaper-12.jpg
Widget imageGroup() {
  return Image.network(
    "https://newevolutiondesigns.com/images/freebies/yellow-wallpaper-12.jpg",
    fit: BoxFit.cover,
  );
}

Widget titleGroup() {
  return Padding(
    padding: const EdgeInsets.only(
      top: 16,
      bottom: 8,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Sunny Flowers',
          style: TextStyle(
            fontSize: 52,
            fontFamily: 'cursive',
          ),
        ),
        Text(
          '12 dosen',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    ),
  );
}

Widget iconGroup() {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(
          Icons.share,
          color: Colors.indigo,
          size: 40,
        ),
        Icon(
          Icons.favorite,
          color: Colors.indigo,
          size: 40,
        ),
      ],
    ),
  );
}

/// here is the text to copy
///Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
Widget textGroup() {
  return Padding(
    padding: const EdgeInsets.only(top: 16, bottom: 40),
    child: Text(
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
      style: TextStyle(
        fontSize: 14,
        fontFamily: 'casual',
      ),
    ),
  );
}

Widget buttonGroup() {
  return ElevatedButton(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(
          Icons.add_shopping_cart,
          color: Colors.white,
        ),
        Text(
          "ADD TO CART",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    ),
    style: TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 13),
      shape: StadiumBorder(),
      elevation: 10,
      backgroundColor: Colors.indigo,
    ),
    onPressed: () {
      print("press me");
    },
  );
}
