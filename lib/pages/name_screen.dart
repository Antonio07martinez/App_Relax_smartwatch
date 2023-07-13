import 'package:flutter/material.dart';
import 'package:app_relax/pages/ambient_screen.dart';
import 'package:app_relax/pages/relax_menu.dart';
import 'package:wear/wear.dart';

class NameScreen extends StatelessWidget {
  final screenHeight;
  final screenWidth;
  const NameScreen(this.screenHeight, this.screenWidth, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AmbientMode(
      builder: (context, mode, child) => mode == WearMode.active? NameScreenIU(
        screenHeight, screenWidth): const AmbientWatchFace(),
    );
  }
}

class NameScreenIU extends StatelessWidget {
  final screenHeight;
  final screenWidth;
  const NameScreenIU (this.screenHeight, this.screenWidth);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(children: <Widget>[
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/outline_arrow.png',scale: 1.0,width: 18,),
                const SizedBox(width: 5),
                const Text('Back', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300))
              ],
            ),
            onTap: (){
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 12),
          const Text(
            'Welcome to',
            style: TextStyle(
              fontSize: 16
            ),
          ),
          const SizedBox(height: 5),
          Text('FlutterOS',
          style: TextStyle(
            fontSize: 25,
            color: Colors.blue[700],
          ),
        ),
        const SizedBox(height: 5),
        ElevatedButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context){
              return RelaxView(screenHeight,screenWidth);
            }));
        },
        child: const Text(
          'NEXT',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
        ),
        )
        ],
      ),
      ),
      ),
    );
  }
}