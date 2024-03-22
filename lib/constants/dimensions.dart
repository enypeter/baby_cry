import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

width() => Get.width;

height() => Get.height;

small20VerticalSpace() => SizedBox(height: 20.h);

small15VerticalSpace() => SizedBox(height: 15.h);

small10VerticalSpace() => SizedBox(height: 10.h);

small5VerticalSpace() => SizedBox(height: 5.h);

small30VerticalSpace() => SizedBox(height: 30.h);

largeVerticalSpace(double factor) => SizedBox(height: height() * factor);

small20HorizontalSpace() => SizedBox(width: 20.w);

small15HorizontalSpace() => SizedBox(width: 15.w);

small10HorizontalSpace() => SizedBox(width: 10.w);

small5HorizontalSpace() => SizedBox(width: 5.w);

small30HorizontalSpace() => SizedBox(width: 30.w);

largeHorizontalSpace(double factor) => SizedBox(width: width() * factor);
