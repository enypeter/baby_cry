import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubenwa_peter/controllers/on_boarding_controller.dart';

RelativeRectTween relativeRectTween(int position, Animation<double> animation,
    OnboardingController onBoardingController) {
  final size = Get.size;
  final height = size.height * 0.4;
  final width = size.width;

  final positions = [
    RelativeRect.fromLTRB(width / 2 - 50, 0, width / 2 - 50, height - 100),
    RelativeRect.fromLTRB(width - 100, height / 2 - 50, 0, height / 2 - 50),
    RelativeRect.fromLTRB(width / 2 - 50, height - 100, width / 2 - 50, 0),
    RelativeRect.fromLTRB(0, height / 2 - 50, width - 100, height / 2 - 50),
  ];

  return RelativeRectTween(
    begin: onBoardingController.forward.isTrue
        ? positions[position]
        : positions[(position + 1) % positions.length],
    end: onBoardingController.forward.isTrue
        ? positions[(position + 1) % positions.length]
        : positions[position],
  );
}