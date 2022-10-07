import 'package:barongxtrade/screens/main_page.dart';
import 'package:barongxtrade/screens/trad.dart';
import 'package:barongxtrade/screens/welcome_view.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';

class LiveChat extends StatefulWidget {
  const LiveChat({super.key});

  @override
  State<LiveChat> createState() => _LiveChatState();
}

class _LiveChatState extends State<LiveChat> {
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
            backgroundColor: Color(0xff010f3b),
            elevation: 1,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 240, 240, 242),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const WelcomePage()));
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
