import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pusher_beams/pusher_beams.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/routes/app_pages.dart';
import 'app/themes/app_theme.dart';
import 'firebase_options.dart';

import 'package:timeago/timeago.dart' as timeago;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings =
      const Settings(persistenceEnabled: true);

  await initializeDateFormatting('id_ID', null);

  timeago.setLocaleMessages('id_ID', timeago.IdMessages());

  await dotenv.load(fileName: ".env");

  await PusherBeams.instance.start(dotenv.env['INSTANCE_ID']!);

  PusherBeams.instance.onMessageReceivedInTheForeground(
      (notification) => print("Notif : $notification"));

  runApp(
    GetMaterialApp(
      title: "Evofly",
      theme: ThemeConfig.themeData,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    ),
  );
}
