import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var flp = FlutterLocalNotificationsPlugin();

  Future<void> setup() async {
    var androidSetup = AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosSetup = DarwinInitializationSettings();
    var setupSetting = InitializationSettings(
      android: androidSetup,
      iOS: iosSetup,
    );
    await flp.initialize(
      setupSetting,
      onDidReceiveNotificationResponse: whenPressed,
    );
  }

  whenPressed(NotificationResponse n1) {
    var payLoad = n1.payload;
    if (payLoad != null) {
      print(payLoad);
    }
  }

  Future<void> showNotification() async {
    var androidNotificationDetails = AndroidNotificationDetails(
      "id",
      "name",
      channelDescription: "detail",
      priority: Priority.max,
      importance: Importance.max,
    );
    var iosNotificationDetails = DarwinNotificationDetails();
    var notificationDetail = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
    await flp.show(0, "title", "Content", notificationDetail, payload: 'Selam');
  }

  @override
  void initState() {
    setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showNotification();
              },
              child: Text('Build notification'),
            ),
          ],
        ),
      ),
    );
  }
}
