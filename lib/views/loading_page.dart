import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubenwa_peter/constants/asset_paths.dart';
import 'package:ubenwa_peter/helpers/image_holder.dart';
import 'package:ubenwa_peter/views/milk_splash.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MilkAnimation();
  }
}
