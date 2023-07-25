import 'dart:math';

import 'package:Evofly/app/helper/notif.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FireBaseNotif extends GetxController {
  String? _fcmToken;

  String? get fcmToken => _fcmToken;

  FireBaseNotif() {
    initFcmToken();

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        Notif.showNotif(
          id: Random().nextInt(99999),
          title: message.notification!.title!,
          body: message.notification!.body!,
          payload: "Message chat",
        );
      },
    );
  }

  void initFcmToken() async {
    _fcmToken = await FirebaseMessaging.instance.getToken();

    print("TOKEN FCM : ${await FirebaseMessaging.instance.getToken()}");

    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('Permission granted: ${settings.authorizationStatus}');
  }

  void sendNotification() async {
    String? targetFCMToken = await FirebaseMessaging.instance.getToken();

    try {
      await FirebaseMessaging.instance.sendMessage(
        to: targetFCMToken,
      );

      print('Notification sent successfully!');
    } catch (e) {
      print('Error sending notification: $e');
    }
  }
}
