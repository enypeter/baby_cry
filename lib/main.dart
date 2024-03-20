import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubenwa_peter/asset_paths.dart';
import 'package:ubenwa_peter/controller.dart';
import 'package:ubenwa_peter/image_holder.dart';

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
      onInit: () => Get.put(OnboardingController()),
      home: const OpeningPage(),
    );
  }
}

class OpeningPage extends StatelessWidget {
  const OpeningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Center(
        child: ImageHolder(
          imagePath: AppImages.ubenwaLogo,
          width: 256,
        ),
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageHolder(
        imagePath: AppImages.splashGif,
        fit: BoxFit.cover,
        height: Get.height,
        width: Get.width,
      ),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  double _angle = 0.0;

  double _oldAngle = 0.0;

  double _angleDelta = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: ImageHolder(
                  imagePath: AppImages.onboarding1,
                  width: 200,
                  height: 200),
            ),
          ),
          Transform.rotate(
            angle: _angle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      //   Offset centerOfGestureDetector = Offset(
                      // constraints.maxWidth / 2, constraints.maxHeight / 2);
                      /**
                       * using center of positioned element instead to better fit the
                       * mental map of the user rotating object.
                       * (height = container height (30) + container height (30) + container height (200)) / 2
                       */
                      Offset centerOfGestureDetector =
                          Offset(constraints.maxWidth / 2, 130);
                      return GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onPanStart: (details) {
                          final touchPositionFromCenter =
                              details.localPosition - centerOfGestureDetector;
                          _angleDelta =
                              _oldAngle - touchPositionFromCenter.direction;
                        },
                        onPanEnd: (details) {
                          setState(
                            () {
                              _oldAngle = _angle;
                            },
                          );
                        },
                        onPanUpdate: (details) {
                          final touchPositionFromCenter =
                              details.localPosition - centerOfGestureDetector;

                          setState(
                            () {
                              _angle = touchPositionFromCenter.direction +
                                  _angleDelta;
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: ImageHolder(imagePath: AppImages.baby1)),
                    SizedBox(
                      height: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: ImageHolder(imagePath: AppImages.baby2)),
                          SizedBox(width: 250),
                          Center(
                              child: ImageHolder(imagePath: AppImages.baby3)),
                        ],
                      ),
                    ),
                    Center(child: ImageHolder(imagePath: AppImages.baby4)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppColors {
  static const Color primaryBlue = Color(0xFF4476F6);
  static const Color accentOrange = Color(0xFFFFB300);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color color9A9A9A = Color(0xFF9A9A9A);
  static const Color color686868 = Color(0xFF686868);
  static const Color colorEBEBEB = Color(0xFFEBEBEB);
  static const Color colorF6C144 = Color(0xFFF6C144);
  static const Color color4476F6 = Color(0xFF4476F6);
  static const Color color07236B = Color(0xFF07236B);
}
//]: # (#4476F6) #4476F6 #F6C144  #4476F6  #07236B   #132C84 #14833D #D60F0F  #ECD5FE  #FEF5D5  #D5E0FE  ##686868 FFB300  #EBEBEB  #FCE1A2  #DEA00F  #EFEFEF

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double _angle = 0.0;
  double _oldAngle = 0.0;
  double _angleDelta = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 100,
                left: 100,
                child: Transform.rotate(
                  angle: _angle,
                  child: Column(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            //   Offset centerOfGestureDetector = Offset(
                            // constraints.maxWidth / 2, constraints.maxHeight / 2);
                            /**
                             * using center of positioned element instead to better fit the
                             * mental map of the user rotating object.
                             * (height = container height (30) + container height (30) + container height (200)) / 2
                             */
                            Offset centerOfGestureDetector =
                                Offset(constraints.maxWidth / 2, 130);
                            return GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onPanStart: (details) {
                                final touchPositionFromCenter =
                                    details.localPosition -
                                        centerOfGestureDetector;
                                _angleDelta = _oldAngle -
                                    touchPositionFromCenter.direction;
                              },
                              onPanEnd: (details) {
                                setState(
                                  () {
                                    _oldAngle = _angle;
                                  },
                                );
                              },
                              onPanUpdate: (details) {
                                final touchPositionFromCenter =
                                    details.localPosition -
                                        centerOfGestureDetector;

                                setState(
                                  () {
                                    _angle = touchPositionFromCenter.direction +
                                        _angleDelta;
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 5,
                        color: Colors.black,
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
