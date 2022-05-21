import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/Art.dart';

class ArtOfCatDetailsScreen extends StatelessWidget {
  final ArtCat artCat;

  ArtOfCatDetailsScreen(this.artCat, {Key? key}) : super(key: key);

  static PageRouteBuilder getRoute(ArtCat artCat) {
    return PageRouteBuilder(pageBuilder: (_, __, ___) {
      return ArtOfCatDetailsScreen(artCat);
    });
  }

  @override
  Widget build(BuildContext context) {
    updateViews();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              Center(child: Text("${artCat.description}")),
              Image.network(artCat.image),
            ],
          ),
        ),
      ),
    );
  }

  void updateViews() {
    FirebaseFirestore.instance
        .collection("gallery")
        .doc(artCat.docId)
        .update({"views": FieldValue.increment(1)});
  }
}
