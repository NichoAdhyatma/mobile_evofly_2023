import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String id;
  String message;
  String sendBy;
  DateTime timestamp;

  MessageModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        message = json['message'],
        sendBy = json['sendBy'],
        timestamp = json['timestamp'] != null
            ? (json['timestamp'] as Timestamp).toDate()
            : DateTime.now();
}
