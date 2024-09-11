import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ghanshyam_mahotsav/utils/app_colors.dart';
import 'package:ghanshyam_mahotsav/utils/app_theme.dart';
import 'package:ghanshyam_mahotsav/utils/loacl_strings.dart';

import 'view/spash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "easstemple-b710e",
    options: const FirebaseOptions(
      apiKey: "AIzaSyA1UZwhQmEe0f-POtlAfZNiN9ZO27bwmSY",
      appId: "1:456460570449:ios:473e784460b94ddbd54d70",
      messagingSenderId: "456460570449",
      projectId: "easstemple-b710e",
    ),
  );
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.scaffoldColor, // status bar color
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppTheme appTheme = AppTheme();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: appTheme.themeData,
      title: 'Ghanshyam Mahotsav',
      translations: LocalStrings(),
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      home: const SplashScreen(),
    );
  }
}

