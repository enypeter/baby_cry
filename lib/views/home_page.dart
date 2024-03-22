import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ubenwa_peter/app_theme.dart';
import 'package:ubenwa_peter/app_typography.dart';
import 'package:ubenwa_peter/constants/asset_paths.dart';
import 'package:ubenwa_peter/constants/constants.dart';
import 'package:ubenwa_peter/constants/dimensions.dart';
import 'package:ubenwa_peter/helpers/image_holder.dart';
import 'package:ubenwa_peter/views/widgets/app_bar.dart';
import 'package:ubenwa_peter/views/widgets/calender_selector.dart';
import 'package:ubenwa_peter/views/widgets/cry_chart.dart';
import 'package:ubenwa_peter/views/widgets/overview_cards.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const CustomAppBar(),
            small15VerticalSpace(),
            Expanded(
              child: ListView(
                children: [
                  const CalenderSelector(),
                  small30VerticalSpace(),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstant.BODY_PADDING),
                    child: Text("Today's Overview",
                        style: TextStyles.style13Medium
                            .copyWith(color: AppColors.color686868)),
                  ),
                  small15VerticalSpace(),
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
                  small20VerticalSpace(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstant.BODY_PADDING),
                    child: Text('Hourly break',
                        style: TextStyles.style13Medium
                            .copyWith(color: AppColors.color686868)),
                  ),
                  small15VerticalSpace(),
                  const HourlyChart(),
                  small20VerticalSpace(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstant.BODY_PADDING),
                    child: Row(
                      children: [
                        _buildContainer(
                            Colors.transparent,
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const ImageHolder(
                                        imagePath: AppImages.challenge,
                                        width: 22,
                                        height: 22),
                                    small10HorizontalSpace(),
                                    Expanded(
                                        child: Text('Daily Challenge',
                                            style: TextStyles.style11Medium))
                                  ],
                                ),
                                small30VerticalSpace(),
                                Stack(
                                  children: [
                                    const SizedBox(
                                      height: 108,
                                      width: 108,
                                      child: CircularProgressIndicator(
                                        value: 0.65,
                                        color: AppColors.colorDEA00F,
                                        backgroundColor: AppColors.colorEFEFEF,
                                        strokeWidth: 30,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Center(
                                        child: Container(
                                          height: 78,
                                          width: 78,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: AppColors.color686868
                                                        .withOpacity(0.2),
                                                    blurRadius: 2,
                                                    spreadRadius: 2,
                                                    offset: const Offset(2, 2)),
                                                BoxShadow(
                                                    color: AppColors.color686868
                                                        .withOpacity(0.2),
                                                    blurRadius: 2,
                                                    spreadRadius: 2,
                                                    offset:
                                                        const Offset(-2, 2)),
                                              ],
                                              shape: BoxShape.circle,
                                              color: AppColors.white),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text("8",
                                                  style: TextStyles
                                                      .style20ExtraBold),
                                              Text(
                                                "out of 12 hours of silence",
                                                textAlign: TextAlign.center,
                                                style: TextStyles.style7Regular,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                small10VerticalSpace(),

                              ],
                            )),
                        small15HorizontalSpace(),
                        _buildContainer(
                          AppColors.primaryBlue,
                          Column(
                            children: [
                              const ImageHolder(
                                  imagePath: AppImages.cryTime,
                                  width: 91,
                                  height: 91),
                              Text('Next Predicted Cry',
                                  style: TextStyles.style11Medium
                                      .copyWith(color: AppColors.white)),
                              Text('12:40 - 14:30',
                                  style: TextStyles.style21Bold
                                      .copyWith(color: AppColors.colorFFBA18)),
                              small5VerticalSpace(),
                              Container(
                                decoration: BoxDecoration(
                                    color: AppColors.white.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(3)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 3),
                                child: Text(
                                  'Set Alarm',
                                  style: TextStyles.style10Regular,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildContainer(Color backgroundColor, Widget widget,
          {Color borderColor = AppColors.colorB7B7B7}) =>
      Expanded(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor,
              border: Border.all(color: borderColor, width: 0.5)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: widget,
        ),
      );
}
