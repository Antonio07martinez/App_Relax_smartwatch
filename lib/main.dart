import 'package:flutter/material.dart';
import 'package:app_relax/pages/ambient_screen.dart';
import 'package:app_relax/pages/start_screen.dart';
import 'package:wear/wear.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)=> MaterialApp(
    title: 'Flutter Wear App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const WatchScreen(),
    debugShowCheckedModeBanner: false,
  );
}

class WatchScreen extends StatelessWidget {
  const WatchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => WatchShape(
    builder: (context,shape,child) => InheritedShape(
      shape: shape, 
      child: AmbientMode(
        builder: (context,mode, child) => 
        mode == WearMode.active ? const StartScreen() : const AmbientWatchFace(),
      ),
    ),
  );
}