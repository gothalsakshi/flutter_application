import 'package:flutter/material.dart';
import '../connectivity_bloc/screen/connectivity_check_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
    Navigator.pushReplacement( context, 
    MaterialPageRoute(builder: (context) => const ConnectivityCheckScreen()),
       );
  });   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset("assets/splashscreen/splashgif.gif", fit: BoxFit.fill),
      ),
    );
  }
}