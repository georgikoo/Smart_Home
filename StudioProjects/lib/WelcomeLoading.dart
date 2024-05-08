import 'package:flutter/material.dart';

import 'MainPage.dart';

class WelcomeLoading extends StatefulWidget {
  const WelcomeLoading({super.key});

  @override
  _WelcomeLoadingState createState() => _WelcomeLoadingState();
}

class _WelcomeLoadingState extends State<WelcomeLoading> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Page'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Logo.png'),
            SizedBox(height: 16.0),
            CircularProgressIndicator(),
            const SizedBox(height: 16.0),
            Text(
              'Transform your space, elevate your life',
              style: TextStyle(fontSize: 20), // Change the font size here
            ),
          ]
      ),
    );
  }
}