import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:noteapp/utils/animation_constants.dart';
import 'package:noteapp/utils/color_constant.dart';
import 'package:noteapp/view/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.mainblack,
      body: Center(
        child: Lottie.asset(AnimationConstants.splashlogo,
            height: 200, repeat: false),
      ),
    );
  }
}
