import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubenwa_peter/constants/asset_paths.dart';
import 'package:ubenwa_peter/helpers/image_holder.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

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
