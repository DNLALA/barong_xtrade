// ignore_for_file: file_names

import 'package:barongxtrade/screens/account.dart';
import 'package:barongxtrade/screens/trad.dart';
import 'package:barongxtrade/screens/uploads.dart';
import 'package:clipboard/clipboard.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BTC extends StatefulWidget {
  const BTC({Key? key}) : super(key: key);

  @override
  State<BTC> createState() => _BTCState();
}

class _BTCState extends State<BTC> {
  TextEditingController controller = TextEditingController();
  String paste = '';
  final String title = 'Copy & Paste - Clipboard';
  late final PageController pageController;

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff010f3b),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 234, 234, 237),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const SigUpPage()));
          },
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          child: Text(
            'Sell BTC',
            style: TextStyle(
              color: Color.fromARGB(255, 239, 231, 231),
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: Column(children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                // ignore: prefer_const_literals_to_create_immutables
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                  child: Image(
                    image: AssetImage(
                        'pics/b6b81f99-2f8c-490c-81c4-d5fd07e0205d.jpg'),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 2.0,
              bottom: 200.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                // ignore: prefer_const_literals_to_create_immutables
              ),
            ),
          ],
        ),

        const Text(
          'Wallet Address: ',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        buildCopy(),
        const SizedBox(
          height: 5,
        ),
        const Text('Network Bitcoin (Btc)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

        SizedBox(
          height: 30,
        ),
        // ElevatedButton(
        //   style: ButtonStyle(
        //     backgroundColor:
        //         MaterialStateProperty.all(Color.fromARGB(255, 13, 13, 159)),
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => images()));
        //   },
        //   child: const Text('Upload Receipt'),
        // ),

        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xffffa446)),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Account()));
          },
          child: Text('Proceed'),
        ),
        const Text(
          "",
          style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 8, 7, 7),
              fontWeight: FontWeight.bold),
        ),
        // ElevatedButton(
        //     onPressed: () async {
        //       final result = await FilePicker.platform.pickFiles(
        //         type: FileType.custom,
        //         allowedExtensions: ['png', 'jpg', 'pdf', 'doc'],
        //         allowMultiple: true,
        //       );
        //       if (result == null) {
        //         ScaffoldMessenger.of(context).showSnackBar(
        //             const SnackBar(content: Text('No file selected')));
        //         return null;
        //       }
        //       final path = result.files.single.path;
        //       final fileName = result.files.single.name;

        //       print(path);
        //       print(fileName);
        //     },
        //     child: Text('Upload recipt'))
      ]),
    );
  }

  Widget buildCopy() => Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
          child: Row(
            children: [
              const Expanded(
                  child: Text('bc1qq7v57j87pzmkvxd43hjdj7vtwj5g7nxa7sdycx')),
              IconButton(
                icon: const Icon(Icons.content_copy),
                onPressed: () async {
                  await FlutterClipboard.copy(controller.text);

                  // Scaffold.of(context)(
                  //   SnackBar(content: Text('✓   Copied to Clipboard')),
                  // );
                },
              ),
            ],
          ),
        ),
      );
}
