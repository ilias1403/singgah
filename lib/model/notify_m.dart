// To parse this JSON data, do
//
//     final notify = notifyFromJson(jsonString);

import 'dart:convert';

Notify notifyFromJson(String str) => Notify.fromJson(json.decode(str));

String notifyToJson(Notify data) => json.encode(data.toJson());

class Notify {
  Notify({
    required this.notification,
    required this.status,
  });

  Notification notification;
  String status;

  factory Notify.fromJson(Map<String, dynamic> json) => Notify(
        notification: Notification.fromJson(json["notification"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "notification": notification.toJson(),
        "status": status,
      };
}

class Notification {
  Notification({
    required this.notificationId,
    required this.tittle,
    required this.body,
    required this.status,
  });

  String notificationId;
  String tittle;
  String body;
  String status;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        notificationId: json["notification_id"],
        tittle: json["tittle"],
        body: json["body"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "notification_id": notificationId,
        "tittle": tittle,
        "body": body,
        "status": status,
      };
}
