import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ubenwa_peter/app_theme.dart';
import 'package:ubenwa_peter/constants/dimensions.dart';
import 'package:ubenwa_peter/controllers/on_boarding_controller.dart';
import 'package:ubenwa_peter/helpers/image_holder.dart';
import 'package:ubenwa_peter/helpers/onboarding_animation_relative_position.dart';
import 'package:ubenwa_peter/views/widgets/custom_button.dart';
import 'package:ubenwa_peter/views/widgets/on_boarding_description_box.dart';
import 'package:ubenwa_peter/views/widgets/onboarding_components.dart';

class OnboardingAnimation extends StatefulWidget {
  @override
  _OnboardingAnimationState createState() => _OnboardingAnimationState();
}

class _OnboardingAnimationState extends State<OnboardingAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  final int animationSpeed = 1200;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: animationSpeed),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  void _handleDrag() {
    if (_controller.isAnimating) {
      return;
    }
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int getImageIndex(int ind) {
      int val = ind > 3 ? (ind % 3) - 1 : ind;
      return val < 0 ? 2 : val;
    }

    return GetX<OnboardingController>(
      builder: (onboardingController) => Column(
        children: [
          SizedBox(
            height: height() * 0.45,
            child: GestureDetector(
              onPanStart: (DragStartDetails details) {
                onboardingController.initial.value = details.globalPosition.dx;
              },
              onPanUpdate: (DragUpdateDetails details) {
                onboardingController.distance.value =
                    details.globalPosition.dx -
                        onboardingController.initial.value;
              },
              onPanEnd: (v) {
                if (onboardingController.distance.value.isNegative) {
                  _handleDrag();
                  onboardingController.animateToNextPage();
                } else {
                  _handleDrag();
                  onboardingController.animateToPreviousPage();
                }
              },
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: animationSpeed),
                        child: ImageHolder(
                            imagePath: onboardingController
                                .onBoardingPageData[
                                    onboardingController.currentPage.value]
                                .centerImage,
                            key: UniqueKey(),
                            width: 200,
                            height: height() * 0.2),
                      ),
                    ),
                  ),
                  PositionedTransition(
                    rect: relativeRectTween(0, _animation, onboardingController)
                        .animate(_controller),
                    child: ImageHolder(
                        imagePath: onboardingController
                            .onBoardingPageData[getImageIndex(
                                onboardingController.currentPage.value + 3)]
                            .focusImage), // Using AppImages for assets
                  ),
                  PositionedTransition(
                    rect: relativeRectTween(1, _animation, onboardingController)
                        .animate(_controller),
                    child: ImageHolder(
                        imagePath: onboardingController
                            .onBoardingPageData[getImageIndex(
                                onboardingController.currentPage.value + 2)]
                            .focusImage),
                  ),
                  PositionedTransition(
                    rect: relativeRectTween(2, _animation, onboardingController)
                        .animate(_controller),
                    child: ImageHolder(
                        imagePath: onboardingController
                            .onBoardingPageData[getImageIndex(
                                onboardingController.currentPage.value + 1)]
                            .focusImage),
                  ),
                  PositionedTransition(
                    rect: relativeRectTween(3, _animation, onboardingController)
                        .animate(_controller),
                    child: ImageHolder(
                        imagePath: onboardingController
                            .onBoardingPageData[getImageIndex(
                                onboardingController.currentPage.value)]
                            .focusImage),
                  ),
                ],
              ),
            ),
          ),
          small30VerticalSpace(),
          carouselIndicator(
              length: 4,
              activeIndex: onboardingController.currentPage.value,
              activeColor: Color(onboardingController
                  .onBoardingPageData[onboardingController.currentPage.value]
                  .focusColor)),
          small20VerticalSpace(),
          DescriptionBox(
            description: onboardingController
                .onBoardingPageData[onboardingController.currentPage.value]
                .description,
            title: onboardingController
                .onBoardingPageData[onboardingController.currentPage.value]
                .title,
          ),
          small20VerticalSpace(),
          onboardingController.currentPage.value ==
                  onboardingController.onBoardingPageData.length - 1
              ? DefaultButton(
                  onTap: () => onboardingController.animateToHome(),
                  title: 'Get Started')
              : SizedBox(height: 70.h),
          largeVerticalSpace(0.06),
          Row(
            children: [
              if (onboardingController.currentPage.value != 0)
                textButton(
                    title: "Previous",
                    onTap: () {
                      _handleDrag();
                      onboardingController.animateToPreviousPage();
                    }),
              const Spacer(),
              if (onboardingController.currentPage.value !=
                  onboardingController.onBoardingPageData.length - 1)
                textButton(
                  onTap: () {
                    _handleDrag();
                    onboardingController.animateToNextPage();
                  },
                  title: onboardingController.currentPage.value == 0
                      ? "Show me how"
                      : "Next",
                  textColor: AppColors.primaryBlue,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
