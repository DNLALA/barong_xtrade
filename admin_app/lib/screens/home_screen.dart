import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:admin_app/provider/dark_them_proviser.dart';
import 'package:admin_app/services/dark%20_them_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Center(
          child: SwitchListTile(
        title: Text('Theme'),
        secondary: Icon(
          themeState.getDarkTheme
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined,
        ),
        onChanged: (bool value) {
          setState(() {
            themeState.setDarkThem = value;
          });
        },
        value: themeState.getDarkTheme,
      )),
    );
  }
}
