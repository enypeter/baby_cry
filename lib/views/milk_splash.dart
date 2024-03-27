import 'package:flutter/material.dart';
import 'package:ubenwa_peter/app_theme.dart';
import 'package:ubenwa_peter/constants/asset_paths.dart';
import 'package:ubenwa_peter/constants/dimensions.dart';
import 'package:ubenwa_peter/helpers/image_holder.dart';
import 'package:ubenwa_peter/views/widgets/bottle_drop.dart';

class MilkAnimation extends StatefulWidget {
  @override
  _MilkAnimationState createState() => _MilkAnimationState();
}

class _MilkAnimationState extends State<MilkAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double initialHeight = 50;
  Color bgColor = AppColors.primaryBlue;

  @override
  void initState() {
    updateAfterAnimation();
    Future.delayed(const Duration(milliseconds: 1140), () {
      _controller.forward();
    });
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();

  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  updateAfterAnimation() {
    Future.delayed(const Duration(milliseconds: 1600), () {
      setState(() {
        initialHeight = 0;
        bgColor = AppColors.white;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          const AnimatedDrop(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedBuilder(
                  animation: _controller!,
                  builder: (context, child) {
                    return ImageHolder(
                      imagePath: AppImages.splash,
                      fit: BoxFit.fill,
                      height: height() * _controller.value + initialHeight,
                      alignment: Alignment.bottomCenter,
                      width: width(),
                    );
                  }),
            ],
          )
        ],
      ),
    );
  }
}

