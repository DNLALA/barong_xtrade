import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Finaly extends StatefulWidget {
  const Finaly({super.key});

  @override
  State<Finaly> createState() => _FinalyState();
}

class _FinalyState extends State<Finaly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
    );
  }
}
