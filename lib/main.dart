import 'package:flutter/material.dart';
import 'package:video_call/ui/login_page.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ZegoUIKit().initLog().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const LoginPage(),
    );
  }
}
