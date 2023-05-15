import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

//https://youtu.be/Yrq2llD2Ldw
//https://pub.dev/packages/flutter_local_notifications



class LocalNotificationService {
  LocalNotificationService();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings(
            '@mipmap/ic_launcher'); //TODO: check if ok
    DarwinInitializationSettings iosInitializationSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);

    await _localNotificationService.initialize(settings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_id', 'channel_name',
            channelDescription: 'description',
            importance: Importance.defaultImportance,
            priority: Priority.defaultPriority,
            playSound: false);

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();

    return const NotificationDetails(
        android: androidNotificationDetails, iOS: darwinNotificationDetails);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) {}

  Future<void> showNotification(int id, String title, String body) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details);
  }

  Future<void> scheduleNotification ({
    required int id, 
    required String title, 
    required String body, 
    required int seconds
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(
            DateTime.now().add(Duration(seconds: seconds)), tz.local),
        details,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id $id');
  }

  void onSelectNotification(String? payload) {
    print('payload $payload');
  }

  Future<void> scheduleDailyNotification() async {
  var androidSettings = AndroidInitializationSettings('app_icon');
  var iosSettings = DarwinInitializationSettings();
  var initializationSettings =
      InitializationSettings(android: androidSettings, iOS: iosSettings);

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  flutterLocalNotificationsPlugin.initialize(initializationSettings);

  var androidDetails = AndroidNotificationDetails(
      'channel_id', 'channel_name',
      importance: Importance.high);
  var iosDetails = DarwinNotificationDetails();
  var generalNotificationDetails =
      NotificationDetails(android: androidDetails, iOS: iosDetails);

  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'Have you logged today?',
    'Remember to log your diet today.',
    _nextInstanceOf7PM(),
    generalNotificationDetails,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );
  print("Notification Scheduled.");
}

  tz.TZDateTime _nextInstanceOf7PM() {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Europe/Rome'));
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(tz.local, now.year, now.month, now.day, 19);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}

