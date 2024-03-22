import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubenwa_peter/app_theme.dart';
import 'package:ubenwa_peter/constants/asset_paths.dart';
import 'package:ubenwa_peter/controllers/cry_record_controller.dart';
import 'package:ubenwa_peter/controllers/on_boarding_controller.dart';
import 'package:ubenwa_peter/constants/dimensions.dart';
import 'package:ubenwa_peter/helpers/image_holder.dart';
import 'package:ubenwa_peter/views/splash_page.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Inter',
        primaryColor: AppColors.primaryBlue,
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      defaultTransition: Transition.fadeIn,
      onInit: () {
        Get.put(OnboardingController());
        Get.put(CryRecordController());
      },
      home: const SplashPage(),
    );
  }
}
