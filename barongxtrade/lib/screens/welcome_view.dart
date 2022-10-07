import 'package:barongxtrade/screens/livechat.dart';

import 'package:barongxtrade/screens/login_screen.dart';
import 'package:barongxtrade/screens/registration_screen.dart';

import 'package:barongxtrade/widgets/costm_btn.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xff010f3b)
            // imCoColor.fromARGB(255, 23, 52, 89)41) //     image: AssetImage('pics/background.png'), fit: BoxFit.cover)
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 70,
              width: 190,
              child: Image(
                image: AssetImage('pics/barong-xtrade-logo-W.png'),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 220),
            CustomBtn(
              buttonText: 'Login',
              buttonColor: Color(0xff010f3b),
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              },
            ),
            const SizedBox(height: 10),
            CustomBtn(
              buttonText: 'SignUp',
              // buttonColor: Color(0xffffa446),
              buttonColor: Color(0xff010f3b),
              textColor: const Color.fromARGB(255, 240, 244, 245),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const RegistrationScreen()));
              },
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LiveChat()));
              },
              child: const Padding(
                padding: EdgeInsets.all(50.0),
                child: Text(
                  'Chat with Us',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
