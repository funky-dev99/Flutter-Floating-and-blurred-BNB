import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

//
// Created by Funky
//
//! Instagram
//? @funky.dev99
//
//! Tik Tok
//? funky.dev
//
//! Facebook
//? Funky-Dev
//
//! GitHub
//? funky.dev99
//
//

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: FinalView(),
    );
  }
}

class FinalView extends StatefulWidget {
  const FinalView({super.key});

  @override
  State<FinalView> createState() => _FinalViewState();
}

class _FinalViewState extends State<FinalView> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(title: const Text("Blurred Bottom Navigation Bar")),
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// GridView
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemBuilder: (context, index) {
              return Card(
                color: theme.primaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Funky",
                        style: theme.textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      "funky.dev99",
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          /// Custom Bottom Navigation Bar
          Positioned(
            bottom: 18,
            left: 18,
            right: 18,
            height: 86,
            child: Container(
              decoration: BoxDecoration(
                border:
                Border.all(width: 2, color: theme.scaffoldBackgroundColor),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(52),
                    bottomRight: Radius.circular(52)),
                color: theme.scaffoldBackgroundColor.withOpacity(0.1),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(52),
                    bottomRight: Radius.circular(52)),
                child: ClipPath(
                  clipper: MyCustomClipper(),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 8, sigmaX: 8),
                    child: Container(),
                  ),
                ),
              ),
            ),
          ),

          /// Bottom Navigation bar items
          Positioned(
              bottom: 18,
              left: 22,
              right: 22,
              height: 86,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _buildBNBItem(Icons.home_outlined, 0),
                  _buildBNBItem(Icons.apps, 1),
                  _buildBNBItem(Icons.notifications_outlined, 2),
                  _buildBNBItem(Icons.settings_outlined, 3),
                ],
              ))
        ],
      ),
    );
  }

  Widget _buildBNBItem(IconData icon, index) {
    return ZoomTapAnimation(
      onTap: () {
        setState(() {
          selectedItem = index;
        });
      },
      child: Icon(
        icon,
        color: selectedItem == index ? Colors.amberAccent : Colors.white,
        size: 30,
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(64, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}