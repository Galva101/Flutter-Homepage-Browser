import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  var physioColour = Colors.amber[400];

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            setState(() {
            });
            return false; //allow exit via back button
          },
          child: SafeArea(
            child: Stack(
              children: <Widget>[
                WebView(
                  initialUrl: "https://www.stadlerphysio.org/",
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _completer.complete(webViewController);
                  },
                  onPageStarted: (start) {
                    setState(() {
                      loading = true;
                    });
                  },
                  onPageFinished: (finish) {
                    setState(() {
                      loading = false;
                    });
                  },
                ),

                loading? Stack(
                    children: <Widget>[
                      Container(
                        height: 2000,
                        color: Colors.white,
                      ),
                      Center(
                        child: CircularProgressIndicator(
                          backgroundColor: physioColour,
                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey),
                        ),
                      ),
                    ],
                ) : Text("")
              ],
            ),
          ),
        ),



        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FutureBuilder<WebViewController>(
                    future: _completer.future,
                    builder: (BuildContext context, AsyncSnapshot<WebViewController> controller) {
                      if(controller.hasData){
                        return FloatingActionButton.extended(
                          icon: Icon(Icons.home),
                          label: Text("Home"),
                          elevation: 10.0,
                          backgroundColor: physioColour,
                          onPressed: () {
                            controller.data.loadUrl("https://www.stadlerphysio.org/");
                            setState(() {
//                              loading=true;
                            });
                          },
                        );
                      }
                      return Container();
                    },
                  ),

              FutureBuilder<WebViewController>(
                    future: _completer.future,
                    builder: (BuildContext context, AsyncSnapshot<WebViewController> controller) {
                      if(controller.hasData){
                        return FloatingActionButton.extended(
                          icon: Icon(Icons.account_box),
                          label: Text("Team"),
                          backgroundColor: physioColour,
                          elevation: 10.0,
                          onPressed: () {
                            controller.data.loadUrl("https://www.stadlerphysio.org/team");
                            setState(() {
//                              loading=true;
                            });
                          },
                        );
                      }
                      return Container();
                    },
                  ),

                  FutureBuilder<WebViewController>(
                    future: _completer.future,
                    builder: (BuildContext context, AsyncSnapshot<WebViewController> controller) {
                      if(controller.hasData){
                        return FloatingActionButton.extended(
                          icon: Icon(Icons.mail),
                          label: Text("Kontakt"),
                          elevation: 10.0,
                          backgroundColor: physioColour,
                          onPressed: () {
                            controller.data.loadUrl("https://www.stadlerphysio.org/contact-us");
                            setState(() {
//                              loading=true;
                            });
                          },
                        );
                      }
                      return Container();
                    },
                  ),
            ],
          ),
        )
      ),
    );
  }
}
