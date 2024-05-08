import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingKitchenScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/Loading_kitchen.jpeg',
          fit: BoxFit.cover,),
          const Positioned(
            bottom: 80.0,
            left: 2.0,
            right: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Kitchen',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}