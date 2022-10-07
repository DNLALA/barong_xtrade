import 'package:barongxtrade/screens/About.dart';
import 'package:barongxtrade/screens/main_page.dart';
import 'package:barongxtrade/screens/settings.dart';
import 'package:barongxtrade/screens/trad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

class LiveChat3 extends StatefulWidget {
  const LiveChat3({super.key});

  @override
  State<LiveChat3> createState() => _LiveChat3State();
}

class _LiveChat3State extends State<LiveChat3> {
  final String title = 'Online Agent';
  final String selectedUrl = 'url';

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  int position = 1;

  final key = UniqueKey();

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A) {
    setState(() {
      position = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Live Chat',
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 36, 81, 140),
            elevation: 1,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 240, 240, 242),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const AboutUs()));
              },
            ),
          ),
          body: IndexedStack(
            index: position,
            children: [
              WebView(
                initialUrl:
                    'https://tawk.to/chat/6306228d54f06e12d8907b64/1gb7vdukj',
                javascriptMode: JavascriptMode.unrestricted,
                key: key,
                onPageFinished: doneLoading,
                onPageStarted: startLoading,
              ),
              Container(
                  color: Colors.white,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
