import 'package:flutter/material.dart';
import 'package:screen_demo/BathroomScreen.dart';
import 'package:screen_demo/BedroomScreen.dart';
import 'package:screen_demo/GardenScreen.dart';
import 'package:screen_demo/HomePage.dart';
import 'package:screen_demo/KitchenScreen.dart';
import 'package:screen_demo/LivingroomScreen.dart';
import 'package:screen_demo/LoadingBathroomScreen.dart';
import 'package:screen_demo/LoadingBedroomScreen.dart';
import 'package:screen_demo/LoadingGardenScreen.dart';
import 'package:screen_demo/LoadingKitchenScreen.dart';
import 'package:screen_demo/LoadingLivingScreen.dart';
import 'package:screen_demo/WelcomeLoading.dart';
import 'package:screen_demo/MainPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

