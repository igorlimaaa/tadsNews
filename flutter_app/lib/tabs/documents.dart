import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Documents extends StatefulWidget {
  @override
  _DocumentsState createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  Widget _buildDocumentsBack() => Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 2, 83, 16),
          Color.fromARGB(255, 27, 154, 48)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      );

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        _buildDocumentsBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Documentos"),
                centerTitle: true,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  title: Text('Item #$index'),
                  onTap: () {
                    _launchURL('http://siep.ifpe.edu.br/anderson/arquivos/tcc_aula1_introducao.pdf');
                  },
                ),
                childCount: 3,
              ),
            )
          ],
        )
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
