
// import 'package:courses_codes/Labs/Lab4/AddPostScreen.dart';
// import 'package:courses_codes/templates/Lab4/AddPostScreenTemplate.dart';

import 'dart:convert';
import 'package:flutter_course/Labs/Lab4/AddPostScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/Labs/Lab4/Post.dart';
import 'package:http/http.dart' as http;




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.teal,
              accentColor: Colors.blueGrey)),
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
  List<Post> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts List"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, AddPostScreenTemplate.getRoute(context));
          },
          child: Icon(Icons.add_comment_sharp),
        ),
        body: posts.isEmpty ? buildEmptyView() : buildUserList()
    );
  }

  Widget buildEmptyView() {
    return Center(
      child: ElevatedButton(onPressed: (){
        getPosts();
      }, child: Text('press me')),
    );
  }

  getPosts()  async{
    ///Exercise 1 call API here

    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body) as List;
      list.forEach((element) {
        Post post = Post.fromJson(element);
        posts.add(post);
      });
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error ${response.reasonPhrase}'),
      ));
    }
  }

  buildUserList() {
    /// Exercise 3 implement the ListView.builder() code here (search Internet if you forgot)

    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                  title: Text(
                    posts[index].title,
                    style: TextStyle(fontSize: 18),
                  ),
                  subtitle: Text(posts[index].body),
                  leading: Icon(Icons.chat),
              ),
              Divider(),
            ],
          );
        });
  }
}


// © 2022 GitHub, Inc.
// Terms
// Privacy