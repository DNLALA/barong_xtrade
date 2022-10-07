import 'package:flutter/material.dart';

class PayMent extends StatefulWidget {
  const PayMent({super.key});

  @override
  State<PayMent> createState() => _PayMentState();
}

class _PayMentState extends State<PayMent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: Text('Payment Info')),
        backgroundColor: Color.fromARGB(255, 36, 81, 140),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
