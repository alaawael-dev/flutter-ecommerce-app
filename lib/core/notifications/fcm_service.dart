// lib/core/notifications/fcm_service.dart

import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'notification_helper.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("Background Message: ${message.messageId}");
}

class FCMService {
  final _messaging = FirebaseMessaging.instance;

  /// Call this from main()
  Future<void> init() async {
    // Background handler
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    // Permissions
    await _requestPermissions();

    // Get token
    await _getToken();

    // Foreground message handling
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("Foreground Message: ${message.messageId}");
      NotificationHelper.showNotification(message);
    });

    // When app is opened from background by tapping a notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      log("Notification opened: ${message.data}");
      // Navigate using GetX if needed:
      // if(message.data["screen"] == "orders") Get.toNamed("/orders");
    });

    // App opened from terminated state
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      log("Launched from terminated by notification");
    }
  }

  Future<void> _requestPermissions() async {
    final settings = await _messaging.requestPermission();
    log("Permission: ${settings.authorizationStatus}");
  }

  Future<void> _getToken() async {
    try {
      final token = await _messaging.getToken();
      log("FCM Token => $token");
    } catch (e) {
      log("Token error: $e");
    }
  }
}
