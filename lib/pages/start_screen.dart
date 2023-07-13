import 'package:flutter/material.dart';
import 'package:app_relax/pages/start_screen.dart';
import 'package:app_relax/pages/name_screen.dart';
import 'package:wear/wear.dart';
import 'utils.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WatchShape(builder: (context, shape, child){
        var screenSize = MediaQuery.of(context).size;
        final shape = InheritedShape.of(context).shape;
        if(shape == WearShape.round){
          screenSize = Size(boxInsetLength(screenSize.width / 2),
          boxInsetLength(screenSize.height /2));
        }
        var screenHeight = screenSize.height;
        var screenWidth = screenSize.width;
        return Center(
          child: Container(
            color:Colors.white,
            height: screenSize.height,
            width: screenSize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const FlutterLogo(size: 70),
                const SizedBox(height: 10),
                const Text(
                  'Jesús Antonio Martínez González',
                  style: TextStyle(color: Colors.blue, fontSize: 10)),
                const SizedBox(height: 5),
                ElevatedButton(
                  child : const Text('START',
                  style: TextStyle(color: Colors.white, fontSize: 18),),
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        return NameScreen(screenHeight,screenWidth);
                      }));
                  },)
              ],
            ),
          ),
        );
      }),
    );
  }
}