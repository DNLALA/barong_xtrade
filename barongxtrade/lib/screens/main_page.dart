import 'package:barongxtrade/push_notifications/push_notifications_system.dart';
import 'package:barongxtrade/screens/livechat.dart';
import 'package:barongxtrade/screens/profile_view.dart';
import 'package:barongxtrade/screens/settings.dart';
import 'package:barongxtrade/widgets/costm_btn.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:barongxtrade/screens/payment.dart';
import 'package:barongxtrade/screens/trad.dart';
import 'package:barongxtrade/screens/trade_now.dart';

import '../screens/usdtcal.dart';

import '../model/user_model.dart';
import 'Contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  @override
  void initState() {
    super.initState();

    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          resizeToAvoidBottomInset: true,
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 50, 15, 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditProfilePage()));
                  },
                  child: ListTile(
                    tileColor: Color.fromARGB(255, 3, 100, 175),
                    focusColor: Color.fromARGB(255, 3, 100, 175),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfilePage()));
                    },
                    selected: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    title: Text(
                      "Welcome Back",
                      style: Theme.of(context).textTheme.subtitle1!.merge(
                            const TextStyle(
                              color: Color(0xffffa446),
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                            ),
                          ),
                    ),
                    subtitle: Text(
                      '${loggedInUser.firstName} ${loggedInUser.secondName}',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    trailing: PopUpMen(
                      icon: CircleAvatar(
                        backgroundImage: const NetworkImage(
                          'https://png.pngtree.com/png-clipart/20200224/original/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_5247852.jpg',
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const EditProfilePage()));
                          },
                        ),
                      ),
                      menuList: [],
                    ),
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(1, 10, 5, 0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1.5,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: true,
                      initialPage: 2,
                      autoPlay: true,
                    ),
                    // ignore: prefer_const_literals_to_create_immutables
                    items: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          child: const Image(
                            image: AssetImage('pics/Screenshot (42).png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          child: const Image(
                            image: AssetImage('pics/Screenshot (44).png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          child: const Image(
                            image: AssetImage('pics/Screenshot (45).png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 120,
              ),
              // const Padding(
              //   padding: EdgeInsets.all(15.0),
              //   child: CustomBtnT(
              //     buttonText: ('ASK FOR RATE'),
              //     buttonColor: Color.fromARGB(255, 36, 81, 140),
              //     textColor: Colors.white,
              //   ),
              // ),

              Padding(
                padding: EdgeInsets.all(15.0),
                child: CustomBtnT1(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const SigUpPage()));
                  },
                  buttonText: ('TRADE NOW'),
                  buttonColor: Color(0xffffa446),
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // ignore: prefer_const_literals_to_create_immutables
                ),
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: (() => setState(() {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (context) => const LiveChat(),
          //             ));
          //       })),
          //   backgroundColor: const Color.fromARGB(255, 3, 100, 175),
          //   child: const Icon(Icons.chat_rounded),
          // ),
        ),
      ),
    );
  }
}

class PopUpMen extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;
  const PopUpMen({Key? key, required this.menuList, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      itemBuilder: ((context) => menuList),
      icon: icon,
    );
  }
}
