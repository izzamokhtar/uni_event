import 'package:flutter/material.dart';
import 'package:uni_event/main_pg.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'main_pg.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await NotificationService.initializeNotification();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDMcUpynPwoCbZk2RfmLvgB6H4JTMNHY-g",
          appId: "1:1040352413300:android:78ea1f1215e1079b9bb321",
          messagingSenderId: "1040352413300",
          projectId: "unievent2-3e205",
          storageBucket: 'unievent2-3e205.appspot.com'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UniEvent Finder',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
