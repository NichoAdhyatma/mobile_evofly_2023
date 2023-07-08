import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String message;
  String sendBy;
  DateTime timestamp;

  MessageModel.fromJson(dynamic json)
      : message = json['message'],
        sendBy = json['sendBy'],
        timestamp = json['timestamp'] != null
            ? (json['timestamp'] as Timestamp).toDate()
            : DateTime.now();
}
