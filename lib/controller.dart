import 'package:get/get.dart';
import 'package:ubenwa_peter/main.dart';

class OnboardingController extends GetxController {
  @override
  onInit() {
    animateToNextSlide();
    super.onInit();
  }

  animateToNextSlide() {
    Future.delayed(const Duration(milliseconds: 1500),
        () => Get.to(() => const OnBoardingPage()));
  }

  animateToHome() {
    Get.to(() => const SplashPage());
    Future.delayed(const Duration(milliseconds: 3800),
        () => Get.to(() => const HomePage()));
  }
}
