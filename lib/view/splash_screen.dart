import 'dart:async';


import 'package:api_login_signup_app/view/world_states.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const WorldStatesScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
            child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
            AnimatedBuilder(
                animation: animationController,
                child: Container(
                  height: 200,
                  width: 200,
                  child: Center(
                    child: Image.asset(
                      'images/virus.png',
                    ),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: animationController.value * 2 * 3.14,
                    child: child,
                  );
                }),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            const Text(
              'Covid-19\nTracker App',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )
                    ],
                  ),
          )),
    );
  }
}
