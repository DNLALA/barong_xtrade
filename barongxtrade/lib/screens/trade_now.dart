import 'package:barongxtrade/screens/BTC.dart';
import 'package:barongxtrade/screens/USDT_QR.dart';
import 'package:barongxtrade/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/dark_them_proviser.dart';

class CurrecyConverter extends StatefulWidget {
  const CurrecyConverter({Key? key}) : super(key: key);

  @override
  State<CurrecyConverter> createState() => _CurrecyConverterState();
}

class _CurrecyConverterState extends State<CurrecyConverter> {
  String? valueschoose;
  String? valueschoose1;
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    // ignore: no_leading_underscores_for_local_identifiers
    final _amount = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    final _tot = TextEditingController();
    int cal;
    int result;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 1, 22, 40),
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 29, 39, 225),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const HomePage()));
              },
            ),
            title: const Padding(
              padding: EdgeInsets.fromLTRB(80, 0, 0, 0),
              child: Text(
                'Rate',
                style: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 29, 39, 225)),
              ),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: Container(
            color: Color.fromARGB(255, 1, 22, 40),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 0, 70, 10),
                  child: DropdownButtonFormField<String>(
                      dropdownColor: Colors.blue,
                      decoration: const InputDecoration(
                        labelText: 'Coin',
                      ),
                      value: valueschoose,
                      items: <String>['USDT', 'Bitcoin'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) => setState(
                            () => valueschoose = value!,
                          )),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  controller: _amount,
                  style: const TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                      labelText: "Amount",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    if (valueschoose == "USDT" && valueschoose1 == "Naira") {
                      cal = int.parse(_amount.text) * 690;
                      result = cal;
                      _tot.text = result.toString();
                    } else if (valueschoose == "Bitcoin" &&
                        valueschoose1 == "Naira") {
                      cal = int.parse(_amount.text) * 78;
                      result = cal;
                      _tot.text = result.toString();
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 13, 13, 159),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text(
                      "Check Rate",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                DropdownButton<String>(
                    value: valueschoose1,
                    items: <String>['Naira'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) => setState(
                          () => valueschoose1 = value!,
                        )),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: const TextStyle(fontSize: 25),
                  controller: _tot,
                  decoration: InputDecoration(
                      prefix: const Text('NGN', style: TextStyle(fontSize: 25)),
                      labelText: "Our Rate",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    if (valueschoose == "USDT" && valueschoose1 == "Naira") {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const USDT()));
                    } else if (valueschoose == "Bitcoin" &&
                        valueschoose1 == "Naira") {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const BTC()));
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 400,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 13, 13, 159),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      "Trade Now",
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
      ),
    );
  }
}
