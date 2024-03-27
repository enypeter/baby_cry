import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubenwa_peter/app_theme.dart';
import 'package:ubenwa_peter/controllers/cry_record_controller.dart';
import 'package:ubenwa_peter/controllers/on_boarding_controller.dart';
import 'package:ubenwa_peter/views/milk_splash.dart';
import 'package:ubenwa_peter/views/on_boarding_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (ctx, child) {
          return GetMaterialApp(
            title: 'ubenwa_peter',
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
            home: const OnBoardingPage(),
          );
        });
  }
}


