import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:screen_demo/HomePage.dart';
import 'package:screen_demo/MenuButton.dart';

import 'LoadingBathroomScreen.dart';

class BathroomScreen extends StatefulWidget {
  const BathroomScreen({super.key});

  @override
  _BathroomScreenState createState() => _BathroomScreenState();
}

class _BathroomScreenState extends State<BathroomScreen> {
  double _brightnessValue = 0.0;
  bool _isoLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed (Duration(seconds: 2),
            () {
          setState(() {
            _isoLoading = false;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return _isoLoading ?
    LoadingBathroomScreen(): _buildBathroomScreen();
  }

  Widget _buildBathroomScreen() {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
            Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'Bathroom',
                          style: TextStyle(color: Colors.blue, fontSize: 30.0,
                            fontWeight: FontWeight.bold,),
                        ),
                        SizedBox(height: 20.0),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset('assets/Bathroom_screen.jpeg',
                            width: 460.0,
                            height: 303.0,
                            fit: BoxFit.cover,),
                        ),
                        SizedBox(height: 10.0),
                        Positioned(
                            bottom: 150,
                            left: 15.0,
                            child: MenuButton()
                        ),
                        SizedBox(height: 10.0,),
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
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.blue, Colors.cyanAccent],),
                                    imageProvider: AssetImage('assets/Bulb.png')),
                              )
                              ,
                              SizedBox(
                                width: 60.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: GradientButton(
                                    onPressed: () {

                                    },
                                    text: 'Light 02',
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [Colors.blue, Colors.cyanAccent],),
                                    imageProvider: AssetImage('assets/Bulb.png')),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: GradientButton(
                              onPressed: () {

                              },
                              text: 'Suction',
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.blue, Colors.cyanAccent],),
                              imageProvider: AssetImage('assets/suction.png'),
                            )
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 460.0,
                            color: Color(0xFFD9D9D9),
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Light Intensity',
                                  style: TextStyle(
                                    fontSize: 20.0, color: Color(0xFF0028F8),
                                  ),),
                                SizedBox(
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
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
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

  GradientButton ({
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
                  Image(image: imageProvider,
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  )
                ],
              )
          )
      ),
    );
  }
}