import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ubenwa_peter/app_theme.dart';
import 'package:ubenwa_peter/app_typography.dart';
import 'package:ubenwa_peter/constants/constants.dart';
import 'package:ubenwa_peter/constants/dimensions.dart';

class HourlyChart extends StatelessWidget {
  const HourlyChart({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final double boxHeight = height() * 0.23;
    var random = Random();
    return Container(
      width: double.maxFinite,
      height: boxHeight,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.primaryBlue,
                AppColors.color07236B
              ])),
      padding: EdgeInsets.symmetric(
          vertical: AppConstant.BODY_PADDING,
          horizontal: AppConstant.BODY_PADDING + 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            12,
                (index) => Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(0.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: AppColors.color052370,
                    ),
                    child: Container(
                      width: 7,
                      margin: EdgeInsets.only(
                          top: boxHeight *
                              random.nextDouble()),
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                        BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ),
                small5VerticalSpace(),
                Text(
                  '${(index * 2)}:00\n${(index * 2) + 2}:00',
                  style: TextStyles.style8Regular
                      .copyWith(color: AppColors.white),
                )
              ],
            )),
      ),
    );
  }
}


