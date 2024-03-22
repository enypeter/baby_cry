import 'package:flutter/material.dart';
import 'package:ubenwa_peter/app_typography.dart';
import 'package:ubenwa_peter/constants/asset_paths.dart';
import 'package:ubenwa_peter/constants/constants.dart';
import 'package:ubenwa_peter/helpers/image_holder.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstant.BODY_PADDING)
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
    );
  }


}
