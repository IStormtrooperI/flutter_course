import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'models/Cat.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => print(value.options.projectId));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
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
        title: Text("Cat Arts"),
      ),
      body: buildFutureBuilderBody(),
    );
  }

  Widget buildFutureBuilderBody() {
    return FutureBuilder(
      future: getArt(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          List<Cat> arts = snapshot.data! as List<Cat>;
          return buildGridView(arts);
          // return Center(child: Text('We have ${arts.length} Arts of Cats'));
        }

        return Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ));
      },
    );
  }

  Widget buildGridView(List<Cat> arts) {
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
            },
            child: Card(
              color: Colors.amberAccent,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      Text('${arts[index].title}',
                          style: TextStyle(fontSize: 15)),
                    ),
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



getArt() async {
  List<Cat> arts = [];
  await FirebaseFirestore.instance
      .collection("gallery")
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((QueryDocumentSnapshot element) {
      arts.add(Cat.fromDoc(element));
    });
  });
  return arts;
}
