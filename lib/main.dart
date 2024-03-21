import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
      onInit: () {
        Get.put(OnboardingController());
        Get.put(CryRecordController());
      },
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
    final OnboardingController controller = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppConstant.BODY_PADDING),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(child: _babyImage(AppImages.baby1)),
                              SizedBox(
                                height: 260,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(child: _babyImage(AppImages.baby2)),
                                    const SizedBox(width: 260),
                                    Center(child: _babyImage(AppImages.baby3)),
                                  ],
                                ),
                              ),
                              Center(child: _babyImage(AppImages.baby4)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    4,
                    (index) => Container(
                          height: 6,
                          width: index == 0 ? 16 : 6,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              color: index == 0
                                  ? AppColors.accentOrange
                                  : AppColors.colorD3DEFC,
                              borderRadius: BorderRadius.circular(5)),
                        )),
              ),
              small30VerticalSpace(),
              const Text(
                "Welcome to a New \nMothering Experince",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
              ),
              small20VerticalSpace(),
              const Text(
                "Now you can understand a lot about your new \nborn, bukkle up for an experience you will \nalways long for.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
              ),
              small30VerticalSpace(),
              GestureDetector(
                onTap: () => controller.animateToHome(),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: AppColors.primaryBlue,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: TextStyles.style18Bold
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
              largeVerticalSpace(0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    radius: 5,
                    onTap: () {},
                    splashColor: AppColors.white,
                    child: Text(
                      "Previous",
                      style: TextStyles.style16Bold
                          .copyWith(color: AppColors.color858585),
                    ),
                  ),
                  InkWell(
                    radius: 5,
                    onTap: () {},
                    splashColor: AppColors.white,
                    child: Text("Next",
                        style: TextStyles.style16Bold
                            .copyWith(color: AppColors.primaryBlue)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _babyImage(image) {
    return Container(
      width: 57,
      height: 57,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image)),
          shape: BoxShape.circle),
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
              _angleDelta = _oldAngle - touchPositionFromCenter.direction;
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
                  _angle = touchPositionFromCenter.direction + _angleDelta;
                },
              );
            },
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppConstant.BODY_PADDING)
                      .copyWith(top: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back_ios_new_rounded),
                  Expanded(
                      child: Text(
                    'Cry Record',
                    style: TextStyles.style18Bold,
                    textAlign: TextAlign.center,
                  )),
                  const ImageHolder(imagePath: AppImages.notification)
                ],
              ),
            ),
            small10VerticalSpace(),
            Expanded(
                child: GetX<CryRecordController>(
              builder: (controller) => ListView(
                children: [
                  SizedBox(
                    height: 25,
                    child: ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsetsDirectional.only(
                            start: AppConstant.BODY_PADDING),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, i) => InkWell(
                              onTap: () => controller.selectedMonth(
                                  getMonth(controller.monthList[i])),
                              child: Text(
                                controller.monthList[i],
                                style: TextStyles.style17Thin.copyWith(
                                    color: AppColors.color9A9A9A,
                                    fontWeight: controller
                                                .selectedMonth.value ==
                                            getMonth(controller.monthList[i])
                                        ? FontWeight.w600
                                        : FontWeight.w300),
                              ),
                            ),
                        separatorBuilder: (_, i) => small15HorizontalSpace(),
                        itemCount: controller.monthList.length),
                  ),
                  small5VerticalSpace(),
                  SizedBox(
                      height: 90,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConstant.BODY_PADDING),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            controller.dayList.length,
                            (i) => GestureDetector(
                              onTap: () => controller
                                  .selectedDate(controller.dayList[i].date),
                              child: Stack(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 6),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(43),
                                        color: controller.selectedDate.value ==
                                                controller.dayList[i].date
                                            ? AppColors.primaryBlue
                                            : AppColors.colorEBEBEB),
                                    width: 40,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.dayList[i].day,
                                          style: TextStyles.style10Thin
                                              .copyWith(
                                                  color: controller.selectedDate
                                                              .value ==
                                                          controller
                                                              .dayList[i].date
                                                      ? AppColors.white
                                                      : AppColors.color9A9A9A),
                                        ),
                                        Text(
                                          controller.dayList[i].date.toString(),
                                          style: TextStyles.style17Thin
                                              .copyWith(
                                                  color: controller.selectedDate
                                                              .value ==
                                                          controller
                                                              .dayList[i].date
                                                      ? AppColors.white
                                                      : AppColors.color9A9A9A,
                                                  fontWeight: controller
                                                              .selectedDate
                                                              .value ==
                                                          controller
                                                              .dayList[i].date
                                                      ? FontWeight.w700
                                                      : FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (controller.selectedDate.value ==
                                      controller.dayList[i].date)
                                    Positioned(
                                      right: 0,
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.accentOrange),
                                        width: 12,
                                        height: 12,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                  small30VerticalSpace(),
                  Text('Overview',
                      style: TextStyles.style13Thin
                          .copyWith(color: AppColors.color686868)),
                  small20VerticalSpace(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstant.BODY_PADDING),
                    child: Row(
                      children: [
                        const OverviewCard(
                          title: 'Number of Cry Episode',
                          bottomTitle: '20% better than yesterday',
                          image: AppImages.number,
                          value: '45',
                          color: AppColors.color14833D,
                        ),
                        small15HorizontalSpace(),
                        const OverviewCard(
                          title: 'Longest Cry Duration',
                          bottomTitle: '20% worst than yesterday',
                          image: AppImages.longest,
                          color: AppColors.colorD60F0F,
                          value: '30mins',
                        ),
                        small15HorizontalSpace(),
                        const OverviewCard(
                          title: 'Cumulative Cry Duration',
                          bottomTitle: '20% better than yesterday',
                          image: AppImages.commulative,
                          value: '4hours',
                          color: AppColors.color14833D,
                        ),
                      ],
                    ),
                  ),
                  small30VerticalSpace(),
                  Text('Overview',
                      style: TextStyles.style13Thin
                          .copyWith(color: AppColors.color686868)),
                  small20VerticalSpace(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class OverviewCard extends StatelessWidget {
  const OverviewCard(
      {super.key,
      required this.image,
      required this.value,
      required this.title,
      required this.color,
      required this.bottomTitle});

  final String title, image, bottomTitle, value;
final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.color132C84, width: 0.5)),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                 ImageHolder(imagePath: image),
                small10HorizontalSpace(),
                Expanded(child: Text(title, style: TextStyles.style8Regular))
              ],
            ),
            small10VerticalSpace(),
            Text(value,
                textAlign: TextAlign.center,
                style: TextStyles.style20ExtraBold),
            small10VerticalSpace(),
            Text(bottomTitle,
                style: TextStyles.style7Regular
                    .copyWith(color: color)),
          ],
        ),
      ),
    );
  }
}

class CryRecordController extends GetxController {
  RxInt selectedDate = 0.obs;
  RxInt selectedMonth = 0.obs;
  RxString selectedCategory = ''.obs;

  RxList monthList = [].obs;
  RxList<DayModel> dayList = <DayModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    selectedMonth(DateTime.now().month);
    selectedDate(DateTime.now().day);
    generateMonthList();
    generateDayList(selectedDate.value, selectedMonth.value);
    super.onInit();
  }

  generateMonthList() {
    List<String> monthsTilePresent = [];

    for (int i = 1; i < 13; i++) {
      monthsTilePresent.add(getMonthName(i));
    }
    monthList(monthsTilePresent);
  }

  generateDayList(int today, int month) {
    List<DayModel> daysTilePresent = [];

    for (int i = today - 3; i < today + 4; i++) {
      daysTilePresent.add(getDay(i, month));
    }

    dayList(daysTilePresent);
  }
}

class DayModel {
  DayModel({required this.day, required this.date});

  final int date;
  final String day;
}

DayModel getDay(int date, int month) {
  var currentYear = DateTime.now().year;
  var currentMonth = month.toString().length > 1 ? month.toString() : '0$month';
  var currentDate = '$currentYear$currentMonth$date';

  var day = DateFormat.E().format(DateTime.parse(currentDate));
  return DayModel(date: date, day: day);
}

getMonthName(int monthNumber) {
  switch (monthNumber) {
    case 1:
      return "Jan";
    case 2:
      return "Feb";

    case 3:
      return "Mar";

    case 4:
      return "Apr";

    case 5:
      return "May";

    case 6:
      return "Jun";

    case 7:
      return "Jul";

    case 8:
      return "Aug";

    case 9:
      return "Sep";

    case 10:
      return "Oct";

    case 11:
      return "Nov";

    case 12:
      return "Dec";
  }
}

getMonth(String month) {
  switch (month) {
    case "Jan":
      return 1;
    case "Feb":
      return 2;

    case "Mar":
      return 3;

    case 'Apr':
      return 4;

    case "May":
      return 5;

    case "Jun":
      return 6;

    case "Jul":
      return 7;

    case "Aug":
      return 8;

    case 'Sep':
      return 9;

    case "Oct":
      return 10;

    case "Nov":
      return 11;

    case "Dec":
      return 12;
  }
}

class AppColors {
  static const Color primaryBlue = Color(0xFF4476F6);
  static const Color accentOrange = Color(0xFFFFB300);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color color858585 = Color(0xFF858585);
  static const Color color9A9A9A = Color(0xFF9A9A9A);
  static const Color colorD3DEFC = Color(0xFFD3DEFC);
  static const Color color686868 = Color(0xFF686868);
  static const Color colorEBEBEB = Color(0xFFEBEBEB);
  static const Color colorF6C144 = Color(0xFFF6C144);
  static const Color color4476F6 = Color(0xFF4476F6);
  static const Color color07236B = Color(0xFF07236B);
  static const Color color132C84 = Color(0xFF132C84);
  static const Color colorECD5FE = Color(0xFFECD5FE);
  static const Color colorD60F0F = Color(0xFFD60F0F);
  static const Color colorFEF5D5 = Color(0xFFFEF5D5);
  static const Color colorD5E0FE = Color(0xFFD5E0FE);
  static const Color colorEFEFEF = Color(0xFFEFEFEF);
  static const Color colorDEA00F = Color(0xFFDEA00F);
  static const Color colorFCE1A2 = Color(0xFFFCE1A2);
  static const Color color14833D = Color(0xFF14833D);
}

class TextStyles {
  static var style20ExtraBold =
      ExtraBold.copyWith(color: AppColors.black, fontSize: 20);
  static var style18ExtraBold =
      ExtraBold.copyWith(color: AppColors.black, fontSize: 18);
  static var style18Bold = Bold.copyWith(color: AppColors.black, fontSize: 18);
  static var style18Regular =
      Regular.copyWith(color: AppColors.black, fontSize: 18);
  static var style18Medium =
      Medium.copyWith(color: AppColors.black, fontSize: 18);

  static var style17Thin = Thin.copyWith(color: AppColors.black, fontSize: 17);

  static var style16ExtraBold =
      ExtraBold.copyWith(color: AppColors.black, fontSize: 16);
  static var style16Bold = Bold.copyWith(color: AppColors.black, fontSize: 16);
  static var style16Regular =
      Regular.copyWith(color: AppColors.black, fontSize: 16);
  static var style16Medium =
      Medium.copyWith(color: AppColors.black, fontSize: 16);

  static var style13Thin = Thin.copyWith(color: AppColors.black, fontSize: 13);
  static var style10Thin = Thin.copyWith(color: AppColors.black, fontSize: 10);
  static var style10Regular =
      Regular.copyWith(color: AppColors.black, fontSize: 10);
  static var style8Regular =
      Regular.copyWith(color: AppColors.black, fontSize: 8);
  static var style7Regular =
      Regular.copyWith(color: AppColors.black, fontSize: 7);

  static TextStyle ExtraBold = TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.3);

  static TextStyle Bold = TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.3);

  static TextStyle Medium = TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.2);

  static TextStyle Regular = TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2);

  static TextStyle Thin = TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.2);
}

class AppConstant {
  static String fontFamily = "Inter";
  static double BODY_PADDING = 20.0;
}

width() => Get.width;

height() => Get.height;

small20VerticalSpace() => const SizedBox(height: 20);

small15VerticalSpace() => const SizedBox(height: 15);

small10VerticalSpace() => const SizedBox(height: 10);

small5VerticalSpace() => const SizedBox(height: 5);

small30VerticalSpace() => const SizedBox(height: 30);

largeVerticalSpace(double factor) => SizedBox(height: height() * factor);

small20HorizontalSpace() => const SizedBox(width: 20);

small15HorizontalSpace() => const SizedBox(width: 15);

small10HorizontalSpace() => const SizedBox(width: 10);

small5HorizontalSpace() => const SizedBox(width: 5);

small30HorizontalSpace() => const SizedBox(width: 30);

largeHorizontalSpace(double factor) => SizedBox(width: width() * factor);
