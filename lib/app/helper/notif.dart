import 'dart:math';

import 'package:Evofly/app/modules/auth/models/user.dart';
import 'package:Evofly/app/services/auth_service.dart';
import 'package:Evofly/app/services/base_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../services/chat_service.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class Notif extends GetxController {
  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  static Future<void> getStreamNotif() async {
    var streamMessage = await ChatService().getNotifStream();

    streamMessage.listen((listMap) async {
      if (listMap.isNotEmpty) {
        for (var element in listMap) {
          if (element['notify'] == false &&
              element['send_by'] !=
                  BaseService().firebaseAuth.currentUser?.uid) {
            UserModel user =
                await AuthService().getUserData(element['send_by']);
            Notif.showNotif(
              title: "Pesan Masuk dari ${user.name}",
              body: element['last_message'],
              id: Random().nextInt(99999),
              payload: "payload",
            );
            ChatService().updateNoitfy(element.id);
          }
        }
      }
    });
  }

  static void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;

    if (notificationResponse.payload != null) {
      print('notification payload: $payload');
    }
  }

  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  static Future<void> showNotif(
      {required int id,
      required String title,
      required String body,
      required String payload}) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'evofly',
      'message',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
