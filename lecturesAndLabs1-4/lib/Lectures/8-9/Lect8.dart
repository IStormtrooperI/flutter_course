// import "package:courses_codes/Lecture9-AsyncAwaite/AddUserScreen.dart";

// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_course/Lectures/10/AddUserScreen.dart';
import 'package:http/http.dart' as http;

import '../models/User.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.deepPurple,
              accentColor: Colors.deepOrangeAccent)),
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
  bool isStacked = true;
  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, AddUser.getRoute());
        },
        child: Icon(Icons.person_add),
      ),
      body: users.isEmpty ? buildEmptyView() : buildUserList(),
    );
  }

  Widget buildEmptyView() {
    return FutureBuilder<List<User>>(
        future: getUsers(),
        builder: (context, snapshot) {
          // on Error
          if (snapshot.hasError) {
            return Center(child: Text("Error"));
          }
          //on Finish
          if (snapshot.connectionState == ConnectionState.done) {
            users = snapshot.data!;
            return buildUserList();
          }
          //when waiting
          return Center(child: CircularProgressIndicator());
        });
  }

  Future<List<User>> getUsers() async {
    List<User> usersList = [];
    print("connecting to API");
    Uri url = Uri.parse('https://gorest.co.in/public/v2/users');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var list = jsonDecode(response.body) as List;
      list.forEach((element) {
        User user = User.fromJson(element);
        usersList.add(user);
      });
      print(usersList);
      return usersList;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error ${response.reasonPhrase}'),
      ));
    }
    return [];
  }

  testFutures() {
    print("I will test Futures");
    Future.delayed(Duration(seconds: 2)).then((value) => setState(() {
          isStacked = !isStacked;
        }));
  }

  Widget buildUserList() {
    return RefreshIndicator(
      onRefresh: () async {
        users = [];
        // await getUsers();
        setState(() {});
        return Future.value(true);
      },
      child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                ListTile(
                    title: Text(
                      users[index].name,
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: Text(users[index].email),
                    leading: Icon(users[index].gender == "female"
                        ? Icons.female
                        : Icons.male),
                    trailing: users[index].status == "active"
                        ? Icon(
                            Icons.done,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.cancel,
                            color: Colors.red,
                          )),
                Divider(),
              ],
            );
          }),
    );
  }
}
