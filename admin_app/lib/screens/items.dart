// import 'package:admin_app/screens/login_screen.dart';
// import 'package:admin_app/screens/uploadcoin.dart';
// import 'package:admin_app/screens/usdt.dart';
// import 'package:flutter/material.dart';

// class Items extends StatefulWidget {
//   const Items({super.key});

//   @override
//   State<Items> createState() => _ItemsState();
// }

// class _ItemsState extends State<Items> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: SafeArea(
//           child: Scaffold(
//             backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//             resizeToAvoidBottomInset: true,
//             appBar: AppBar(
//               title: Text('Add coin'),
//               centerTitle: true,
//             ),
//             body: SafeArea(
//               child: Padding(
//                 padding: EdgeInsets.all(15.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     InkWell(
//                       onTap: (() {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ItemList(),
//                             ));
//                       }),
//                       child: Container(
//                         alignment: Alignment.center,
//                         height: 60,
//                         width: 400,
//                         decoration: BoxDecoration(
//                             color: Color.fromARGB(255, 239, 216, 97),
//                             borderRadius: BorderRadius.circular(50)),
//                         child: const Text(
//                           "Transcations",
//                           style: TextStyle(
//                               fontSize: 30,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: (() {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => UploadBrandsScreen(),
//                             ));
//                       }),
//                       child: Container(
//                         alignment: Alignment.center,
//                         height: 60,
//                         width: 400,
//                         decoration: BoxDecoration(
//                             color: Color.fromARGB(255, 36, 81, 140),
//                             borderRadius: BorderRadius.circular(50)),
//                         child: const Text(
//                           "BTC",
//                           style: TextStyle(
//                               fontSize: 30,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
            
//             ),
//           ),
//         ));
//   }
// }
