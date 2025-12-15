// lib/core/notifications/notification_helper.dart

import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'my_channel_id',
    'High Importance Notifications',
    description: 'Used for important notifications.',
    importance: Importance.high,
  );

  /// Call this once in main()
  static Future<void> init() async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final settings = InitializationSettings(android: androidSettings);

    await _plugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (resp) {
        log("Notification tapped: ${resp.payload}");
      },
    );

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  /// Show a foreground notification
  static Future<void> showNotification(RemoteMessage message) async {
    final notification = message.notification;

    await _plugin.show(
      notification.hashCode,
      notification?.title ?? message.data["title"] ?? "New Message",
      notification?.body ?? message.data["body"] ?? "",
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      payload: message.data.toString(),
    );
  }
}
