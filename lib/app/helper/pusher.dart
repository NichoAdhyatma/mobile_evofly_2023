import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class PusherNotification {
  final String apiUrl =
      "https://${dotenv.env['INSTANCE_ID']}.pushnotifications.pusher.com/publish_api/v1/instances/${dotenv.env['INSTANCE_ID']}/publishes";

  final Map<String, String> headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer ${dotenv.env['PRIMARY_KEY']}"
  };

  final String requestBody =
      '{"interests":["hello"],"fcm":{"notification":{"title":"Hello", "body":"Hello, world!"}}}';

  void sendNotification() async {
    try {
      var request = await http.post(Uri.parse(apiUrl),
          headers: headers, body: requestBody);

      if (request.statusCode == 200) {
        print('response 200 OK!');
      }
    } catch (e) {
      rethrow;
    }
  }
}
