import 'package:get/get.dart';
import 'package:ubenwa_peter/constants/asset_paths.dart';
import 'package:ubenwa_peter/models/on_boarding_model.dart';
import 'package:ubenwa_peter/views/home_page.dart';
import 'package:ubenwa_peter/views/on_boarding_page.dart';
import 'package:ubenwa_peter/views/loading_page.dart';

class OnboardingController extends GetxController {
  RxInt currentPage = 0.obs;
  RxDouble angle = 0.0.obs;
  RxDouble oldAngle = 0.0.obs;
  RxDouble angleDelta = 0.0.obs;
  RxDouble initial = 0.0.obs;
  RxDouble distance = 0.0.obs;
  RxBool forward = true.obs;

  @override
  onInit() {
    loadSplash();
    super.onInit();
  }

  animateToNextPage() {forward(true);
    if (currentPage.value < onBoardingPageData.length - 1) {
      currentPage.value++;
    } else {
      currentPage(0);
    }
  }

  animateToPreviousPage() {
    forward(false);
    if (currentPage.value != 0) {
      currentPage.value--;
    }
  }

  List<OnBoardingModel> onBoardingPageData = [
    OnBoardingModel(
      title: "Welcome to a New \nMothering Experince",
      description:
          "Now you can understand a lot about your new \nborn, bukkle up for an experience you will \nalways long for.",
      centerImage: AppImages.onboarding1,
      focusImage: AppImages.baby1,
      focusColor: 0xFFF6C144,
    ),
    OnBoardingModel(
      title: "A Cry with Meaning",
      description:
          "Now with great feedbacks, you can \nunderstand a lot about your new born cry \npatter and prepare for common cry peak \nperiod.",
      centerImage: AppImages.onboarding2,
      focusImage: AppImages.baby2,
      focusColor: 0xFF4476F6,
    ),
    OnBoardingModel(
      title: "Analytical Insight",
      description:
          "Be your baby’s doctor by viewing great insight\n and analysis; you get to see how your baby cry \nactivity varies in terms of duration and frequency \nto help you make good decisions",
      centerImage: AppImages.onboarding3,
      focusImage: AppImages.baby3,
      focusColor: 0xFFF6C144,
    ),
    OnBoardingModel(
      title: "Happy Mom\nHappy Home",
      description:
          "Reduce you baby crying time whilst \ngetting your schedule back together by \nplanning for time of cry activity and time of \nquite.",
      centerImage: AppImages.onboarding4,
      focusImage: AppImages.baby4,
      focusColor: 0xFF4476F6,
    ),
  ];

  loadSplash() {
    Future.delayed(const Duration(milliseconds: 1500),
        () => Get.to(() => const OnBoardingPage()));
  }

  animateToHome() {
    Get.to(() => const LoadingPage());
    Future.delayed(const Duration(milliseconds: 3800),
        () => Get.to(() => const HomePage()));
  }
}
