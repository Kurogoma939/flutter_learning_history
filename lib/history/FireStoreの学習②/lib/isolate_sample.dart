import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:isolate';

/// isolateを使ったコーディング
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  Future<void> _incrementCounter() async {
    var recivePort = ReceivePort();
    var sendPort = recivePort.sendPort;
    late Capability capability;

    // 子供からメッセージを受け取る
    recivePort.listen((message) {
      print(message);
      recivePort.close();
    });

    final isolate = await Isolate.spawn(child, sendPort);

    Timer(Duration(seconds: 5), () {
      print("pausing");
      capability = isolate.pause();
    });
    Timer(Duration(seconds: 10), () {
      print("resume");
      isolate.resume(capability);
    });

    Timer(Duration(seconds: 15), () {
      print("kill");
      isolate.kill();
    });

    setState(() {
      _counter++;
    });
  }

  static void child(SendPort sendPort) {
    int i = 0;
    // 親にメッセージを送る
    Timer.periodic(Duration(seconds: 1), (timer) => {sendPort.send(i++)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}