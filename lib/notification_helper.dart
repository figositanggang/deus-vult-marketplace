import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInititalize =
        new AndroidInitializationSettings("mipmap/ic_launcher");
    var iosInitialize = new DarwinInitializationSettings();
    var initializationSettings = new InitializationSettings(
      android: androidInititalize,
      iOS: iosInitialize,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showNotification({
    var id = 0,
    required String title,
    required String body,
    var payload,
    required FlutterLocalNotificationsPlugin fln,
  }) async {
    AndroidNotificationDetails androidNotificationDetails =
        new AndroidNotificationDetails(
      'channelId',
      'channelName',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
      enableLights: true,
    );

    var notification = NotificationDetails(
      android: androidNotificationDetails,
      iOS: DarwinNotificationDetails(),
    );

    await fln.show(0, title, body, notification);
  }
}
