import 'package:barongxtrade/screens/BTC.dart';
import 'package:barongxtrade/screens/USDT_QR.dart';
import 'package:barongxtrade/screens/usdtcal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main_page.dart';

class SigUpPage extends StatefulWidget {
  const SigUpPage({super.key});

  @override
  State<SigUpPage> createState() => _SigUpPageState();
}

class _SigUpPageState extends State<SigUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff010f3b),
        title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
              child: Text(
                'Trade',
                style: TextStyle(
                  color: Color.fromARGB(255, 249, 244, 244),
                  fontSize: 30,
                ),
              ),
            )),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 236, 236, 237),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const HomePage()));
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const USDTcal(),
                      ));
                }),
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Color(0xffffa446),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "Trade USDT",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              InkWell(
                onTap: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BTC(),
                      ));
                }),
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Color(0xff010f3b),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Text(
                    "Trade BTC",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
