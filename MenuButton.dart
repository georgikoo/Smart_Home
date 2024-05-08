import 'package:flutter/material.dart';
import 'package:screen_demo/BathroomScreen.dart';
import 'package:screen_demo/BedroomScreen.dart';
import 'package:screen_demo/GardenScreen.dart';
import 'package:screen_demo/KitchenScreen.dart';
import 'package:screen_demo/LivingroomScreen.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({super.key});

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  bool _showButtons = false;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                _showButtons = !_showButtons;
              });
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: Colors.black,
              padding: const EdgeInsets.all(20)
            ),
            child: _showButtons
                ? Image.asset('assets/Logo.png', width: 50, height: 50) // Replace 'assets/close_icon.png' with your image path
                : Image.asset('assets/Logo.png', width: 50, height: 50), // Replace 'assets/main_button_image.png' with your image path
          ),
          const SizedBox(width: 20),
          if (_showButtons)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BathroomScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Bathroom',
                  style: TextStyle(
                    color: Colors.black, fontSize: 15.0,
                  ),),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BedroomScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Bedroom',
                  style: TextStyle(
                    color: Colors.black, fontSize: 15.0,
                  ),),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LivingroomScreen()),
                    );
                    },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Living room',
                  style: TextStyle(
                    color: Colors.black, fontSize: 15.0,
                  ),),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GardenScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Garden',
                  style: TextStyle(
                    color: Colors.black, fontSize: 15.0,
                  ),),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const KitchenScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text('Kitchen',
                  style: TextStyle(
                    color: Colors.black, fontSize: 15.0,
                  ),),
                ),
              ],
            ),
        ],


      );
  }
}