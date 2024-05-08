import 'package:flutter/material.dart';


class LoadingBedroomScreen extends StatelessWidget {
  const LoadingBedroomScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/Loading_bedroom.jpg',
            fit: BoxFit.cover,),
          const Positioned(
            top: 100.0,
            left: 330.0,
            right: 1.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Bedroom',
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