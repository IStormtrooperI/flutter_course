import 'package:cloud_firestore/cloud_firestore.dart';

class ArtCat {
  late String description;
  late String image;
  late int views;
  late String docId;

  ArtCat.fromDoc(QueryDocumentSnapshot doc) {
    description = doc["description"];
    image = doc["image"];
    views = doc["views"];
    docId = doc.id;
  }
}
