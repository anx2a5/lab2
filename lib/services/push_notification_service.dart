  import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void setupLocalNotifications() {
  const initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings('app_icon'),
    iOS: IOSInitializationSettings(),
  );
  flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> showNotification() async {
  const notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
    ),
  );
  await flutterLocalNotificationsPlugin.show(
    0,
    'Joke of the Day',
    'It\'s time to check out today\'s joke!',
    notificationDetails,
  );
}
