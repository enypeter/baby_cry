import 'package:flutter/material.dart';
import 'package:ubenwa_peter/app_theme.dart';
import 'package:ubenwa_peter/constants/constants.dart';

class TextStyles {
  static var style21Bold = Bold.copyWith(color: AppColors.black, fontSize: 21);

  static var style20ExtraBold =
  ExtraBold.copyWith(color: AppColors.black, fontSize: 20);

  static var style18ExtraBold =
  ExtraBold.copyWith(color: AppColors.black, fontSize: 18);
  static var style18Bold = Bold.copyWith(color: AppColors.black, fontSize: 18);
  static var style18Regular =
  Regular.copyWith(color: AppColors.black, fontSize: 18);
  static var style18Medium =
  Medium.copyWith(color: AppColors.black, fontSize: 18);

  static var style17Thin = Thin.copyWith(color: AppColors.black, fontSize: 17);

  static var style16ExtraBold =
  ExtraBold.copyWith(color: AppColors.black, fontSize: 16);
  static var style16Bold = Bold.copyWith(color: AppColors.black, fontSize: 16);
  static var style16Regular =
  Regular.copyWith(color: AppColors.black, fontSize: 16);
  static var style16Medium =
  Medium.copyWith(color: AppColors.black, fontSize: 16);

  static var style13Medium =
  Medium.copyWith(color: AppColors.black, fontSize: 13);
  static var style13Thin = Thin.copyWith(color: AppColors.black, fontSize: 13);

  static var style11Medium =
  Medium.copyWith(color: AppColors.black, fontSize: 13);

  static var style10Thin = Thin.copyWith(color: AppColors.black, fontSize: 10);
  static var style10Regular =
  Regular.copyWith(color: AppColors.black, fontSize: 10);

  static var style8Regular =
  Regular.copyWith(color: AppColors.black, fontSize: 8);
  static var style8Thin = Thin.copyWith(color: AppColors.black, fontSize: 8);

  static var style7Regular =
  Regular.copyWith(color: AppColors.black, fontSize: 7);

  static var style6Regular =
  Regular.copyWith(color: AppColors.black, fontSize: 6);

  static TextStyle ExtraBold = TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.3);

  static TextStyle Bold = TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.3);

  static TextStyle Medium = TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontWeight: FontWeight.w500,
      letterSpacing: -0.2);

  static TextStyle Regular = TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.2);

  static TextStyle Thin = TextStyle(
      fontFamily: AppConstant.fontFamily,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.2);
}
