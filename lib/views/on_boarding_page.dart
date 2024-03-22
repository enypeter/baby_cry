import 'package:flutter/material.dart';
import 'package:ubenwa_peter/constants/constants.dart';
import 'package:ubenwa_peter/views/on_boarding_animated_slide.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppConstant.BODY_PADDING),
          child: OnboardingAnimation(),
        ),
      ),
    );
  }
}
