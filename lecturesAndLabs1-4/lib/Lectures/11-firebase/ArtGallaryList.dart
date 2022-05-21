import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/Lectures/models/Art.dart';

import 'ArtDetails.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepOrangeAccent,
      )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FireBase"),
      ),
      body: FutureBuilder(
        future: getArt(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            List<ArtCat> arts = snapshot.data! as List<ArtCat>;
            return buildGridView(arts);
            // return Center(child: Text('We have ${arts.length} Arts of Cats'));
          }

          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 3,
          ));
        },
      ),
    );
  }

  getArt() async {
    List<ArtCat> arts = [];
    await FirebaseFirestore.instance
        .collection("gallery")
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((QueryDocumentSnapshot element) {
        arts.add(ArtCat.fromDoc(element));
      });
    });
    return arts;
  }

  Widget buildGridView(List<ArtCat> arts) {
    return RefreshIndicator(
      onRefresh: () async {
        await getArt();
        setState(() {});
        return Future.value();
      },
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemCount: arts.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context, ArtOfCatDetailsScreen.getRoute(arts[index]));
            },
            child: Card(
              color: Colors.amber,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Image.network(
                      arts[index].image,
                      cacheHeight: 200,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text('${arts[index].description}',
                              style: TextStyle(fontSize: 15))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.remove_red_eye),
                          SizedBox(
                            width: 8,
                          ),
                          Text('${arts[index].views}',
                              style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
