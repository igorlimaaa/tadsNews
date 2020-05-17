import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/tiles/documents_tile.dart';

class DocumentsTab extends StatelessWidget {

  Widget _buildDocumentsBack() =>
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 2, 83, 16),
              Colors.white
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      );

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: <Widget>[
          _buildDocumentsBack(),
          FutureBuilder<QuerySnapshot>(
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
          )
        ],
    );
  }
}

