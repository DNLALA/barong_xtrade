import 'dart:io';

import 'package:barongxtrade/global/global.dart';
import 'package:barongxtrade/model/user_model.dart';
import 'package:barongxtrade/screens/finaly.dart';
import 'package:barongxtrade/services/firebase_auth_service.dart';
import 'package:barongxtrade/widgets/costm_textfl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:image_picker/image_picker.dart';

import 'USDT_QR.dart';
import 'main_page.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  String imageUrl = '';
  _MyFormState() {
    _selectBank = _bankList[0];
  }

  final url = 'https://api.paystack.co/bank/validate';
  TextEditingController bank = TextEditingController();
  TextEditingController bankNumber = TextEditingController();
  TextEditingController bankName = TextEditingController();
  String timeId = DateTime.now().toString();
  final _bankList = [
    'Access Bank Plc',
    "Citibank Nigeria Limited",
    'Ecobank Nigeria Plc',
    'Fidelity Bank Plc',
    'FIRST BANK NIGERIA LIMITED',
    'First City Monument Bank Plc',
    'Globus Bank Limited',
    'Guaranty Trust Bank Plc',
    'Heritage Banking Company Ltd.',
    'eystone Bank Limited',
    'Parallex Bank Ltd',
    'Polaris Bank Plc',
    'Premium Trust Bank ',
    'Providus Bank ',
    'STANBIC IBTC BANK PLC',
    'Standard Chartered Bank Nigeria Ltd.',
    'Sterling Bank Plc',
    'SunTrust Bank Nigeria Limited',
    'Titan Trust Bank Ltd',
    'Union Bank of Nigeria Plc',
    'United Bank For Africa Plc',
    'Unity Bank Plc',
    'Wema Bank Plc',
    'Zenith Bank Plc',
  ];
  String? _selectBank = '';

  // ignore: prefer_final_fields
  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('transactions');
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
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text(
              'Payment Info',
              style: TextStyle(
                color: Color.fromARGB(255, 245, 243, 243),
                fontSize: 30,
              ),
            )),
        backgroundColor: Color(0xff010f3b),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xffffa446)),
                ),
                onPressed: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  print('${file?.path}');
                  if (file == null) return;

                  String uniqueFileName =
                      DateTime.now().millisecondsSinceEpoch.toString();

                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImages = referenceRoot.child('recipe');

                  Reference referenceImageToUPload =
                      referenceDirImages.child(uniqueFileName);

                  //if erros
                  try {
                    //upload file
                    await referenceImageToUPload.putFile(File(file.path));

                    //getdowlad
                    imageUrl = await referenceImageToUPload.getDownloadURL();
                  } catch (error) {
                    //erros

                  }
                },
                child: Text('Upload Recipt'),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: DropdownButtonFormField(
                  items: _bankList
                      .map((e) => DropdownMenuItem(
                            // ignore: sort_child_properties_last
                            child: Text(e),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      _selectBank = val as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down_circle,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Bank Name',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: bankNumber,
                  style: const TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                      labelText: "Account Number",
                      labelStyle: TextStyle(
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(200))),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: bankName,
                  style: const TextStyle(fontSize: 25),
                  decoration: InputDecoration(
                      labelText: "Account Name",
                      labelStyle: TextStyle(
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(200))),
                ),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffffa446)),
                  ),
                  onPressed: () {
                    if (imageUrl.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'Please upload recipt',
                        style: TextStyle(
                          color: Color.fromARGB(255, 245, 243, 243),
                          // fontSize: 30,
                        ),
                      )));
                      return;
                    }
                    if (_selectBank!.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'Please Choose a bank',
                        style: TextStyle(
                          color: Color.fromARGB(255, 245, 243, 243),
                          // fontSize: 30,
                        ),
                      )));
                      return;
                    }
                    if (bankNumber.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'put your account number',
                        style: TextStyle(
                          color: Color.fromARGB(255, 245, 243, 243),
                          // fontSize: 30,
                        ),
                      )));
                      return;
                    }
                    _collectionRef.add({
                      'bank': _selectBank,
                      'accountNumber': bankNumber.text,
                      'accountName': bankName.text,
                      'image': imageUrl,
                      'time': timeId,
                      'uid': loggedInUser.uid,
                    }).whenComplete(() => showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              backgroundColor: Color(0xff010f3b),
                              // title: Text('Account Recived', textAlign: TextAlign(Center),),
                              content: Text(
                                'We are confirming your crypto, You will be notified after confirmation and when payment is made. Thank you for your patience!',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 249, 244, 244),
                                  fontSize: 13,
                                ),
                              ),
                              actions: [
                                MaterialButton(
                                  color: Color(0xff010f3b),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                HomePage()));
                                  },
                                  child: Text('OK'),
                                )
                              ],
                            )));
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
