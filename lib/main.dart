import 'package:appy_innovate/app/di.dart';
import 'package:appy_innovate/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'presentation/mainPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await  initAppModule();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPage();
  }
}
