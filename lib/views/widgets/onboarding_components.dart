import 'package:flutter/material.dart';
import 'package:ubenwa_peter/app_theme.dart';
import 'package:ubenwa_peter/app_typography.dart';

Row carouselIndicator(
    {required Color activeColor,
      required int length,
      required int activeIndex}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: List.generate(
        length,
            (index) => Container(
          height: 6,
          width: index == activeIndex ? 16 : 6,
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              color: index == activeIndex
                  ? activeColor
                  : AppColors.colorD3DEFC,
              borderRadius: BorderRadius.circular(5)),
        )),
  );
}

InkWell textButton({onTap, title, Color textColor = AppColors.color858585}) {
  return InkWell(
    radius: 5,
    onTap: onTap,
    splashColor: AppColors.white,
    child: Text(
      title,
      style: TextStyles.style16Bold.copyWith(color: textColor),
    ),
  );
}
