import 'package:barongxtrade/screens/account.dart';
import 'package:barongxtrade/screens/main_page.dart';
import 'package:barongxtrade/screens/trad.dart';
import 'package:barongxtrade/screens/uploads.dart';
import 'package:clipboard/clipboard.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

class USDT extends StatefulWidget {
  const USDT({Key? key}) : super(key: key);

  @override
  State<USDT> createState() => _USDTState();
}

class _USDTState extends State<USDT> {
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
    int name = 0;
    final _amount = 2;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(0xff010f3b),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 238, 238, 243),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const SigUpPage()));
          },
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          child: Text(
            'Sell USDT',
            style: TextStyle(
              color: Color.fromARGB(255, 245, 243, 243),
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              // Container(
              //   height: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30.0),
              //     // ignore: prefer_const_literals_to_create_immutables
              //   ),
              //   child: ClipRRect(
              //     borderRadius: BorderRadius.circular(30.0),
              //     child: const Padding(
              //       padding: EdgeInsets.fromLTRB(30, 100, 0, 0),
              //       child: Image(
              //         image: AssetImage(
              //             'pics/895af2da-896c-46b4-9469-ae21cf0d85d5.jpg'),
              //         fit: BoxFit.scaleDown,
              //       ),
              //     ),
              //   ),
              // ),

              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(

                      // ignore: prefer_const_literals_to_create_immutables
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

          const SizedBox(
            height: 20,
          ),
          const Text(
            'Wallet Address: ',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          buildCopy(),
          const SizedBox(
            height: 5,
          ),
          const Text('Network: Ethereum (ERC20)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          const SizedBox(
            height: 25,
          ),
          //wl2
          const Text(
            'Wallet Address: ',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          buildCopy1(),
          const SizedBox(
            height: 1,
          ),
          const Text('Network: Tron (TRC20)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 25,
          ),
          //wl3
          const Text(
            'Wallet Address: ',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          buildCopy2(),
          const SizedBox(
            height: 1,
          ),
          const Text('Network: Solana',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 25,
          ),
          //wl4
          const Text(
            'Wallet Address: ',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          buildCopy3(),
          const SizedBox(
            height: 1,
          ),
          const Text('Network: Tezos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 25,
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
        ]),
      ),
    );
  }

  Widget buildCopy() => Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.fromLTRB(25, 1, 20, 0),
          child: Row(
            children: [
              const Expanded(
                  child: SelectableText(
                      '0x41fb4683bdf66d6a92f2f83ef5eed663f873e9e7')),
              IconButton(
                icon: const Icon(Icons.content_copy),
                onPressed: () {
                  FlutterClipboard.copy(controller.text);

                  // Scaffold.of(context)(
                  //   SnackBar(content: Text('✓   Copied to Clipboard')),
                  // );
                },
              ),
            ],
          ),
        ),
      );

  Widget buildCopy1() => Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.fromLTRB(25, 1, 20, 0),
          child: Row(
            children: [
              const Expanded(
                  child: SelectableText('THFsm6RPzCm5GrtzjBf31z9aYrgaTWsRwB')),
              IconButton(
                icon: const Icon(Icons.content_copy),
                onPressed: () {
                  FlutterClipboard.copy(controller.text);

                  // Scaffold.of(context)(
                  //   SnackBar(content: Text('✓   Copied to Clipboard')),
                  // );
                },
              ),
            ],
          ),
        ),
      );

  Widget buildCopy2() => Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.fromLTRB(25, 1, 20, 0),
          child: Row(
            children: [
              const Expanded(
                  child: SelectableText(
                      '6gTJ1LZrpvWB2PEuVGLex9Z7L8co8URzyygHoaSpJrxM')),
              IconButton(
                icon: const Icon(Icons.content_copy),
                onPressed: () {
                  FlutterClipboard.copy(controller.text);

                  // Scaffold.of(context)(
                  //   SnackBar(content: Text('✓   Copied to Clipboard')),
                  // );
                },
              ),
            ],
          ),
        ),
      );
  Widget buildCopy3() => Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.fromLTRB(25, 1, 20, 0),
          child: Row(
            children: [
              const Expanded(
                  child:
                      SelectableText('tz1dywt3efvciju4RV55SrCamDtbZpbF1tWf')),
              IconButton(
                icon: const Icon(Icons.content_copy),
                onPressed: () {
                  FlutterClipboard.copy(controller.text);

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
