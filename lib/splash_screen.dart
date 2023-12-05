import 'package:clean_archeticture_posts_app/core/colors.dart';
import 'package:clean_archeticture_posts_app/core/utils/utils.dart';
import 'package:clean_archeticture_posts_app/features/presentation/pages/homePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   Color aColor = Color(0xFF66b6d2);
   Color bColor = Color(0xFFbee0ec);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3),(){
      navigateAndFinish(context, const Home());
    });
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [aColor, bColor],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft),
      ),
          child: Center(child: Text('bostatk'.toUpperCase(),style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.blue
          ),)),
    ),
    );
  }
}
