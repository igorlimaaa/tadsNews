import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/configs/notifications.dart';
import 'package:flutter_app/tabs/documents.dart';
import 'package:flutter_app/tabs/documents_tab2.dart';
import 'package:flutter_app/tabs/home_tab.dart';
import 'package:flutter_app/tabs/site_tab.dart';
import 'package:flutter_app/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pageControler = PageController();

  _configureNotification(){
    FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage");
        if(Platform.isIOS){
          print(message);
        } else {
          NotificationService.showNotification(message["notification"]["title"], message["notification"]["body"]);
        }
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume");
        if(Platform.isIOS){
          print(message);
        } else {
          NotificationService.showNotification(message["notification"]["title"], message["notification"]["body"]);
        }
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch");
        if(Platform.isIOS){
          print(message);
        } else {
          NotificationService.showNotification(message["notification"]["title"], message["notification"]["body"]);
        }
      },
    );
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token){
      print(token);
    });
  }

  @override
  void initState(){
    super.initState();
    _configureNotification();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageControler,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(pageControler),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("TADS - News"),
            centerTitle: true,
            backgroundColor: Color.fromARGB(255, 2, 83, 16),
          ),
          drawer: CustomDrawer(pageControler),
          body: SiteTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Documentos"),
            centerTitle: true,
          ),
          body: DocumentsTab2(),
          drawer: CustomDrawer(pageControler),
        ),
      ],
    );
  }
}
