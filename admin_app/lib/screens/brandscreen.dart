import 'package:admin_app/screens/first.dart';
import 'package:admin_app/screens/items.dart';
import 'package:admin_app/screens/uploadcoin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/user_model.dart';

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
          appBar: AppBar(
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => const Items())));
                }),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 50, 15, 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SigUpPage()));
                  },
                  child: ListTile(
                    tileColor: Color.fromARGB(255, 3, 100, 175),
                    focusColor: Color.fromARGB(255, 3, 100, 175),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SigUpPage()));
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
                                    builder: (context) => const SigUpPage()));
                          },
                        ),
                      ),
                      menuList: [],
                    ),
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
