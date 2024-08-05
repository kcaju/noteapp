import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:noteapp/utils/app_sessions.dart';
import 'package:noteapp/view/splash_screen/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox(AppSessions.NOTEBOX); //hive -step 1
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
