import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/tiles/documents_tile.dart';

class DocumentsTab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance.collection("documents").getDocuments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        else {
          var dividedTiles = ListTile.divideTiles(
                  tiles: snapshot.data.documents.map((doc) {
                    return DocumentsTitle(doc);
                  }).toList(),
                  color: Colors.grey[500])
              .toList();
          return ListView(
            children: dividedTiles,
          );
        }
      },
    );
  }
}
