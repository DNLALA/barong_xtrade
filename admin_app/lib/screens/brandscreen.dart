import 'package:admin_app/screens/items.dart';
import 'package:admin_app/screens/uploadcoin.dart';
import 'package:admin_app/screens/usdt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/user_model.dart';
import 'profile_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

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
                              color: Color.fromARGB(255, 239, 216, 97),
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
              const SizedBox(
                height: 100,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemList(),
                              ));
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 239, 216, 97),
                              borderRadius: BorderRadius.circular(50)),
                          child: const Text(
                            "Transcations",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      InkWell(
                        onTap: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ItemList(),
                              ));
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 36, 81, 140),
                              borderRadius: BorderRadius.circular(50)),
                          child: const Text(
                            "BTC",
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
            ],
          ),
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
