import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class NavDr extends StatelessWidget {
  const NavDr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: CurvedNavigationBar(
          animationDuration: Duration(microseconds: 300),
          color: Color.fromARGB(255, 235, 231, 231),
          backgroundColor: Color.fromARGB(255, 139, 5, 5),
          onTap: (index) {},
          items: [
            Icon(Icons.home),
            Icon(Icons.payment),
            Icon(Icons.perm_identity_rounded),
          ],
        ),
      ),
    );
  }
}
