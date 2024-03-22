
import 'package:flutter/material.dart';
import 'package:get/get.dart';

width() => Get.width;

height() => Get.height;

small20VerticalSpace() => const SizedBox(height: 20);

small15VerticalSpace() => const SizedBox(height: 15);

small10VerticalSpace() => const SizedBox(height: 10);

small5VerticalSpace() => const SizedBox(height: 5);

small30VerticalSpace() => const SizedBox(height: 30);

largeVerticalSpace(double factor) => SizedBox(height: height() * factor);

small20HorizontalSpace() => const SizedBox(width: 20);

small15HorizontalSpace() => const SizedBox(width: 15);

small10HorizontalSpace() => const SizedBox(width: 10);

small5HorizontalSpace() => const SizedBox(width: 5);

small30HorizontalSpace() => const SizedBox(width: 30);

largeHorizontalSpace(double factor) => SizedBox(width: width() * factor);
