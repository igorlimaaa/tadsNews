import 'package:flutter/material.dart';
import 'package:flutter_app/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer (this.pageController);

  Widget _buildDrawerBack() => Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 2, 83, 16),
          Colors.white
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 15.0,
                      child: Text("TADS-News",
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold
                        ),),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Olá,",
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold
                            ),),
                          GestureDetector(
                            child: Text("Entre ou cadastre-se",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor
                            ),),
                            onTap: (){

                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.cloud, "Início", pageController, 0),
              DrawerTile(Icons.data_usage, "IFPE - Notícias", pageController, 1),
              DrawerTile(Icons.picture_as_pdf, "Documentos", pageController, 2),
            ],
          )
        ],
      ),
    );
  }
}
