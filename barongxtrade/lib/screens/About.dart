import 'package:barongxtrade/screens/live2.dart';
import 'package:barongxtrade/screens/live3.dart';
import 'package:barongxtrade/screens/livechat.dart';
import 'package:barongxtrade/screens/settings.dart';
import 'package:barongxtrade/screens/trad.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
                builder: (BuildContext context) => const SettingsPage()));
          },
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
          child: Text(
            'About Us',
            style: TextStyle(
              color: Color.fromARGB(255, 239, 231, 231),
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Barong Xtrade also known as BX brings crypto and Blockchain solution to the unreached! To help make crypto and Blockchain products easily accessible to all. Barong Xtrade BX offers the easiest medium to sell cryptocurrency.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Barong Xtrade BX is your number one stop shop to trade all your Bitcoin and other crypto, bringing an awesome blockchain experience in your hands! We offer access to safe and secure wallets, with awesome customer service experience and a user friendly app.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Barong Xtrade BX serves both the beginner and advanced trader in an awesome way.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Providing access to crypto services for all.',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Instant sell',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: (() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const LiveChat3()));
              }),
              child: Text(
                'LEARN MORE ABOUT OUR SERVICES',
                style: TextStyle(
                  color: Color(0xffffa446),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
