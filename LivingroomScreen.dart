import 'package:flutter/material.dart';
import 'package:screen_demo/LoadingLivingScreen.dart';
import 'package:screen_demo/MenuButton.dart';

import 'HomePage.dart';

class LivingroomScreen extends StatefulWidget {
  const LivingroomScreen({super.key});

  @override
  _LivingroomScreenState createState() => _LivingroomScreenState();
}

class _LivingroomScreenState extends State<LivingroomScreen> {
  int _lightLevel = 1;
  bool _acOn = false;
  double _temperature = 24.0;
  double _brightnessValue = 0.0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2),
        () {
      setState(() {
        _isLoading = false;
      });
        }
    );
  }

  void _toggleLight() {
    setState(() {
      _lightLevel = (_lightLevel + 1) % 4;
    });
  }

  void _toggleAC() {
    setState(() {
      _acOn =!_acOn;
    });
  }

  void _changeTemperature(double newTemperature) {
    setState(() {
      _temperature = newTemperature;
    });
  }
  @override
  Widget build(BuildContext context) {
    return _isLoading ?
        LoadingLivingScreen(): _buildLivingScreen();
  }

  @override
  Widget _buildLivingScreen() {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Stack(
        children: [ SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Text(
                  'living Room',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,),),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset('assets/Living_screen.jpg',
                    width: 460.0,
                    height: 303.0,
                    fit: BoxFit.cover,),
                ),
              ),
              const SizedBox(
                  height: 10.0),
              const Positioned(
                bottom: 150,
                left: 15.0,
                child: MenuButton(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GradientButton(
                          onPressed: () {

                          },
                          text: 'Light 01',
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.blue, Colors.cyanAccent],),
                          imageProvider: const AssetImage('assets/Bulb.png')),
                    ),
                    const SizedBox(
                      width: 60.0,),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GradientButton(
                          onPressed: () {

                          },
                          text: 'Light 02',
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.blue, Colors.cyanAccent],),
                          imageProvider: const AssetImage('assets/Bulb.png')),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only (left: 10.0 ),
                        child: GradientButton(
                          onPressed: () {
                          },
                          text: 'Curtains',
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.blue, Colors.cyanAccent],),
                          imageProvider: const AssetImage('assets/curtains.png',),
                        )
                    ),
                    const SizedBox(
                      height: 60.0,),
                    Padding(
                        padding: const EdgeInsets.only( left: 40.0 ),
                        child: GradientButton(
                          onPressed: () {

                          },
                          text: 'AC',
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.blue, Colors.cyanAccent],),
                          imageProvider: const AssetImage('assets/AC.png', ),
                        )
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: 460.0,
                    color: const Color(0xFFD9D9D9),
                    padding: const EdgeInsets.all(16.0),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'AC controller',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFF0028F8),),),
                        const SizedBox(
                          height: 16.0,
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              trackHeight: 30.0,
                              thumbColor: Colors.yellow,
                              overlayColor: Colors.transparent,
                              thumbShape: CustomSliderThumbCircle(
                                thumbRadius: 17.0,
                                min: 0,
                                max: 1,
                              )
                          ),
                          child: Slider(
                            value: _brightnessValue,
                            onChanged: (newValue) {
                              setState(() {
                                _brightnessValue = newValue;
                              });
                            },
                            min: 0.0,
                            max: 1.0,
                            activeColor: Colors.yellow,
                            inactiveColor: Colors.black,
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,)
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final double min;
  final double max;

  CustomSliderThumbCircle({
    required this.thumbRadius,
    required this.min,
    required this.max,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, paint);
  }
}

class GradientButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Gradient gradient;
  final ImageProvider<Object> imageProvider;

  const GradientButton ({super.key,
    required this.onPressed,
    required this.text,
    required this.gradient,
    required this.imageProvider,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 100.0,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(13.0),
      ),
      child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(13.0),
            onTap: () {
              onPressed();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: imageProvider,
                ),
                const SizedBox(
                  width: 3.0,),
                Text(text, style: const TextStyle(
                  color: Colors.black, fontSize: 20.0,),)
              ],
            ),

          )
      ),
    );
  }
}
