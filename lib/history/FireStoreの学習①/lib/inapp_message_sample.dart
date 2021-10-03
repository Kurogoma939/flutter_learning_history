import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

///Firebase => エンゲージメント =>In-App Messaging

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InApp Notice',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'InApp Notice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // fiam = firebase in app messasing
  // 静的プロパティ・インスタンス化の省略
  static FirebaseInAppMessaging fiam = FirebaseInAppMessaging();

  @override
  void initState() {
    super.initState();
    fiam.triggerEvent('update_event');
    FirebaseMessaging.instance.getToken().then((String? token) {
      print("token");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          'FIAMテスト',
          //スタイルは変更なしなのでconstで定数化
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
