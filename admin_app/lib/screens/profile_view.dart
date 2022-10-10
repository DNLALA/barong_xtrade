import 'package:admin_app/screens/login_screen.dart';
import 'package:admin_app/screens/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:admin_app/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'brandscreen.dart';

// import 'package:barongxtrade/screens/settings.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  bool showPassword = false;
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff010f3b),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 241, 241, 244),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const MainScreen()));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Color.fromARGB(255, 250, 250, 250),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const Text(
                "Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              // Center(
              //   child: Stack(
              //     children: [
              //       // Container(
              //       //   width: 130,
              //       //   height: 130,
              //       //   decoration: BoxDecoration(
              //       //       border: Border.all(
              //       //           width: 4,
              //       //           color: Theme.of(context).scaffoldBackgroundColor),
              //       //       boxShadow: [
              //       //         BoxShadow(
              //       //             spreadRadius: 2,
              //       //             blurRadius: 10,
              //       //             color: Color.fromARGB(255, 36, 81, 140)
              //       //                 .withOpacity(0.1),
              //       //             offset: const Offset(0, 10))
              //       //       ],
              //       //       shape: BoxShape.circle,
              //       //       image: const DecorationImage(
              //       //           fit: BoxFit.cover,
              //       //           image: NetworkImage(
              //       //             "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
              //       //           ))),
              //       // ),

              //       Positioned(
              //           bottom: 0,
              //           right: 0,
              //           child: Container(
              //             height: 40,
              //             width: 40,
              //             decoration: BoxDecoration(
              //               shape: BoxShape.circle,
              //               border: Border.all(
              //                 width: 4,
              //                 color: Theme.of(context).scaffoldBackgroundColor,
              //               ),
              //               color: Color.fromARGB(255, 36, 81, 140),
              //             ),
              //             child: const Icon(
              //               Icons.edit,
              //               color: Colors.white,
              //             ),
              //           )),
              //     ],
              //   ),
              // ),

              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Icon(
                    Icons.person,
                    color: Color(0xffffa446),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Account",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '${loggedInUser.firstName} ${loggedInUser.secondName}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '${loggedInUser.email}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const SizedBox(
                height: 300,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffffa446)),
                      ),
                      onPressed: () async {
                        FirebaseAuth.instance.signOut();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => LoginScreen()));
                      },
                      child: const Text('Log Out')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
