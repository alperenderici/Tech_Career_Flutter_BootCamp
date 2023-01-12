import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPage();
}

class _NotificationPage extends State<NotificationPage> {
  var flp = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bildirim kullanimi"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {
                createNotif();
              },
              child: const Text("Bildirim olustur."))
        ],
      )),
    );
  }

  Future<void> setup() async {
    var androidSetup = AndroidInitializationSettings("@mipmap/ic_launcher");
    var iosSetup = IOSInitializationSettings();
    var setpSetting =
        InitializationSettings(android: androidSetup, iOS: iosSetup);
    await flp.initialize(setpSetting);
  }

  Future<void> createNotif() async {
    var androidNotifyDetail = AndroidNotificationDetails("id", "name",
        channelDescription: "description",
        priority: Priority.high,
        importance: Importance.max);
    var iosNotifyDetail = IOSNotificationDetails();
    var notifyDetails =
        NotificationDetails(android: androidNotifyDetail, iOS: iosNotifyDetail);
    await flp.show(0, "Baslik", "Icerik", notifyDetails);
  }
}
