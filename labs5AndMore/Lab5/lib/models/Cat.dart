import 'package:cloud_firestore/cloud_firestore.dart';

class Cat {
  late String description;
  late String title;
  late String image;
  late String docId;

  Cat.fromDoc(QueryDocumentSnapshot doc) {
    description = doc["description"];
    image = doc["image"];
    title = doc["title"];
    docId = doc.id;
  }
}
