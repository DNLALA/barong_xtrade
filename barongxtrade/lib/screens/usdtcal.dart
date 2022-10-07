import 'package:barongxtrade/screens/account.dart';
import 'package:barongxtrade/screens/main_page.dart';
import 'package:barongxtrade/screens/trad.dart';
import 'package:barongxtrade/screens/uploads.dart';
import 'package:clipboard/clipboard.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

import 'USDT_QR.dart';

class USDTcal extends StatefulWidget {
  const USDTcal({Key? key}) : super(key: key);

  @override
  State<USDTcal> createState() => _USDTcalState();
}

class _USDTcalState extends State<USDTcal> {
  int name = 0;
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
          // title: Image.asset(
          //   'pics/Frame(1).png',
          //   height: 99,
          //   width: 100,
          // ),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: Row(
              children: [
                Text(
                  'Sell USDT',
                  style: TextStyle(
                    color: Color.fromARGB(255, 245, 243, 243),
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 80,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontSize: 25),
                      decoration: InputDecoration(
                          // prefixText: ('USD  '),
                          labelText: "Amount in USD",
                          labelStyle: TextStyle(
                              fontSize: 15, color: Colors.grey.shade400),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(200))),
                      onChanged: (val) {
                        setState(() {
                          name = int.parse(val) * 9;
                        });
                      },
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                  child: Text(
                'Amount you will receive',
                style: TextStyle(
                  fontSize: 20,
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                'NGN ${name.toString()}',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                child: Center(
                    child: Text(
                  'Note: The total value derived would be the \n amout you will be receiving after the\n transaction process.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                  ),
                )),
              ),

              //wl1
              const SizedBox(
                height: 90,
              ),

              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffffa446)),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => USDT()));
                  },
                  child: Text('Proceed'),
                ),
              ),
            ],
          ),
        ));
  }
}
