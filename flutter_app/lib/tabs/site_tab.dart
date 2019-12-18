import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SiteTab extends StatefulWidget {
  @override
  _SiteTabState createState() => _SiteTabState();
}

class _SiteTabState extends State<SiteTab> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  Widget _buildSiteBack() => Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 2, 83, 16),
          Colors.white
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: "https://portal.ifpe.edu.br/noticias",
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
              child: Icon(Icons.ac_unit),
              onPressed: () {
                controller.data
                    .loadUrl("https://www.youtube.com/mariananolasco");
              });
          }
          return Container(
            child: _buildSiteBack(),
          );
        },

      ),
    );
  }
}
