import 'package:flutter/material.dart';

import 'BathroomScreen.dart';
import 'BedroomScreen.dart';
import 'GardenScreen.dart';
import 'KitchenScreen.dart';
import 'LivingroomScreen.dart';
import 'MainPage.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:
      Stack(
          fit: StackFit.expand,
          children: [ SingleChildScrollView(
            child: Container(
              width: 700,
              height: 800,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF0D47A1),
                    Color(0xFFFFFFFF),
                  ],
                  tileMode: TileMode.mirror,
                ),
              ),
              child: Row(
                children: [
                  //SizedBox(height: 30.0 ,),
                  //SizedBox(height: 90.0),
                  const SizedBox(
                    height: 30.0,),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Positioned(
                        top: 200.0,
                        left: 10.0,
                        child: Text(
                          'Welcome \n Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.58),
                        child: GradientButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const LivingroomScreen()),
                              );
                            },
                            text: 'Living room',
                            imageProvider: const AssetImage('assets/Living_screen.jpg'),
                            screenWidth: screenWidth,),
                      ),
                      const SizedBox(
                        height: 30.0,),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.30),
                        child: GradientButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const KitchenScreen()),
                              );
                            },
                            text: 'Kitchen',
                            imageProvider: const AssetImage('assets/Kitchen_screen.jpeg'),
                          screenWidth: screenWidth,),
                      ),
                      const SizedBox(
                        height: 30.0,),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.15),
                        child: GradientButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const BedroomScreen()),
                              );
                            },
                            text: 'Bedroom',
                            imageProvider: const AssetImage('assets/Bedroom_screen.jpeg'),
                          screenWidth: screenWidth,),
                      ),
                      const SizedBox(
                        height: 30.0,),
                      Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.30),
                          child: GradientButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BathroomScreen()),
                              );
                            },
                            text: 'Bathroom',
                            imageProvider: const AssetImage('assets/Bathroom_screen.jpeg',),
                            screenWidth: screenWidth,
                          )
                      ),
                      const SizedBox(
                        height: 30.0,),
                      Padding(
                          padding: EdgeInsets.only (left: screenWidth * 0.58),
                          child: GradientButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const GardenScreen()),
                              );
                            },
                            text: 'Garden',
                            imageProvider: const AssetImage('assets/Garden.jpg',),
                            screenWidth: screenWidth,
                          )
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,),
                ],
              ),
            ),
          ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainPage()));
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final ImageProvider<Object> imageProvider;
  final double screenWidth;

  const GradientButton ({super.key,
    required this.onPressed,
    required this.text,
    required this.imageProvider,
    required this.screenWidth,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 195.0,
      height: 75.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(33.0),
      ),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(33.0),
              onTap: () {
                onPressed();
              },
              child: Stack( children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(33.0),
                  child: Image(
                    image: imageProvider ,
                    width: 195.0,
                    height: 75.0 ,
                    color: Colors.white24 ,
                    colorBlendMode: BlendMode.colorBurn ,
                    fit: BoxFit.fill,),),
                Positioned(
                  left: 45,
                  top: 20,
                  //textAlign: TextAlign.center,
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.center,),)
              ],)
          )
      ),
    );
  }
}