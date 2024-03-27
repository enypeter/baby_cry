import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ubenwa_peter/app_theme.dart';
import 'package:ubenwa_peter/app_typography.dart';
import 'package:ubenwa_peter/constants/asset_paths.dart';
import 'package:ubenwa_peter/helpers/image_holder.dart';

class AnimatedDrop extends StatefulWidget {
  const AnimatedDrop({super.key});

  @override
  State<AnimatedDrop> createState() => _AnimatedDropState();
}

class _AnimatedDropState extends State<AnimatedDrop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, -12),
      end: const Offset(0, 20),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SlideTransition(
              position: _animation,
              child: Padding(
                padding: const EdgeInsets.only(left: 7.0),
                child: ImageHolder(
                  imagePath: AppImages.drop,
                  width: 15.w,
                ),
              )),
        ),
        Center(
            child: Text(
          "Please wait while we\ngather your Baby’s data...",
          textAlign: TextAlign.center,
          style: TextStyles.style18Bold.copyWith(color: AppColors.white),
        )),
        Positioned.fill(
          top: 0,
          child: Align(
              alignment: Alignment.topCenter,
              child: ImageHolder(
                  imagePath: AppImages.bottle, width: 211.w)),
        ),
      ],
    );
  }
}
