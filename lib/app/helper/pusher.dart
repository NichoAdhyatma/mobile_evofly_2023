import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PusherNotification {
  void sendPushNotification(String interest, {required String title, required String body}) async {
    String url =
        'https://${dotenv.env['INSTANCE_ID']}.pushnotifications.pusher.com/publish_api/v1/instances/${dotenv.env['INSTANCE_ID']}/publishes';
    String? authToken =
       dotenv.env['PRIMARY_KEY'];

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
    };

    Map<String, dynamic> data = {
      'interests': [interest],
      'fcm': {
        'notification': {
          'title': title,
          'body': body,
        }
      }
    };

    String jsonData = jsonEncode(data);

    try {
      var response =
          await http.post(Uri.parse(url), headers: headers, body: jsonData);

      if (response.statusCode == 200) {
        print('Notification sent successfully!');
        print('Response: ${response.body}');
      } else {
        print('Failed to send notification.');
        print('Response status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error sending the request: $e');
    }
  }
}
