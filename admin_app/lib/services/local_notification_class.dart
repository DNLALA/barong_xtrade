// import 'dart:ffi';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class LocalNotificationServec {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static void initialize() {
//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: AndroidInitializationSettings('@mipmap/ic_launcher'));

//     _notificationsPlugin.initialize(initializationSettings);
//   }

//   static void display(RemoteMessage message) async {
//     try {
//       final id = DateTime.now().microsecondsSinceEpoch ~/ 100;
//       final NotificationDetails notificationDetails = NotificationDetails(
//         android: AndroidNotificationDetails(
//             'barongxtrade', 'barongxtrade channle',
//             priority: Priority.high, importance: Importance.max),
//       );

//       await _notificationsPlugin.show(
//         id,
//         message.notification!.title,
//         message.notification!.body,
//         notificationDetails,
//       );
//     } on Exception catch (e) {
//       print(e);
//     }
//   }
// }
