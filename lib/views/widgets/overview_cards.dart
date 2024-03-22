import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubenwa_peter/app_theme.dart';
import 'package:ubenwa_peter/app_typography.dart';
import 'package:ubenwa_peter/constants/dimensions.dart';
import 'package:ubenwa_peter/helpers/image_holder.dart';

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
        padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              children: [
                ImageHolder(imagePath: image, width: 24, height: 24),
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
                textAlign: TextAlign.center,
                style: TextStyles.style7Regular.copyWith(color: color)),
          ],
        ),
      ),
    );
  }
}
