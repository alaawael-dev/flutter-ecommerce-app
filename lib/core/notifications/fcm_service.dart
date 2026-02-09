// lib/core/notifications/fcm_service.dart

import 'dart:developer';
import 'package:ecommerce/controller/orders/pending_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
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

    refreshPageNotification(data) {
      print("=======================================================");
      print(data["pageid"]);
      print(data["pagename"]);
      print(Get.currentRoute);
      if (Get.currentRoute == "/pendingorders" &&
          data["pagename"] == "refresh") {
        PendingController controller = Get.find();
        controller.refreshPage();
      }
    }

    ;

    // Foreground message handling
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("Foreground Message: ${message.messageId}");
      NotificationHelper.showNotification(message);
      refreshPageNotification(message.data);
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
