import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubenwa_peter/app_theme.dart';

class MilkSplashScreen extends StatefulWidget {
  const MilkSplashScreen({super.key});

  @override
  State<MilkSplashScreen> createState() => _MilkSplashScreenState();
}

class _MilkSplashScreenState extends State<MilkSplashScreen> {
  final containerHeight = Get.height;
  double heightFactor = 0.2;
  double maxCurve = 250;
  double curveFactor = 0.3;

  @override
  initState() {
    increaseHeight();
    super.initState();
  }

  increaseHeight() {
    Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (heightFactor > 0.50) {
        timer.cancel();
      } else {
        heightFactor = heightFactor + 0.1;
        curveFactor = curveFactor + 0.1;
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [
              AppColors.black.withOpacity(0.0),
              AppColors.black.withOpacity(0.25),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 2000),
              padding: EdgeInsets.zero,
              curve: Curves.fastOutSlowIn,
              width: Get.width,
              height: containerHeight * heightFactor,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        offset: Offset(-2, 2))
                  ],
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(maxCurve * curveFactor))),
            )
          ],
        ),
      ),
    );
  }
}
