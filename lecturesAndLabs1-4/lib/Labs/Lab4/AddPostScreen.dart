import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPostScreenTemplate extends StatefulWidget {
  /// make the screen introduce it self
  static getRoute(BuildContext context) {
    /// Exercise 4 return PageRouteBuilder to show this screen recap last lesson or search Internet if you forgot
    return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => AddPostScreenTemplate(),);
  }

  const AddPostScreenTemplate({Key? key}) : super(key: key);

  @override
  _AddPostScreenTemplateState createState() => _AddPostScreenTemplateState();
}

class _AddPostScreenTemplateState extends State<AddPostScreenTemplate> {

  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new user'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(
                icon: Icon(Icons.title),
                filled: true,
                hintText: 'write title here...',
                labelText: 'title ',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              controller: body,
              maxLines: 5,
              decoration: const InputDecoration(
                icon: Icon(Icons.comment),
                filled: true,
                hintText: 'write Comment here',
                labelText: 'Comment',
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  /// Exercise 5 call addComment with Named parameter
                  NamedParameter(title, body);
                },
                child: Text("Add Comment".toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }

  NamedParameter(TextEditingController title, TextEditingController body) {
    addComment(title.text, body.text);
  }

  addComment(String title, String body) async{
    /// Exercise 5 call Post API here

    Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    Map<String, String> responseHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'charset': 'UTF-8'
    };
    var responseBody = jsonEncode({ "userId": 1, "title": title, "body": body,});
    var response = await http.post(url, headers: responseHeaders, body: responseBody,);
    print(response.statusCode);
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Post Added'),
      ));
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error ${response.reasonPhrase}'),
      ));
    }
  }
}