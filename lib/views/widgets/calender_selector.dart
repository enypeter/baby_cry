import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ubenwa_peter/app_theme.dart';
import 'package:ubenwa_peter/app_typography.dart';
import 'package:ubenwa_peter/constants/constants.dart';
import 'package:ubenwa_peter/constants/dimensions.dart';
import 'package:ubenwa_peter/controllers/cry_record_controller.dart';
import 'package:ubenwa_peter/helpers/day_fromatter.dart';

class CalenderSelector extends StatelessWidget {
  const CalenderSelector({super.key});

  @override
  Widget build(BuildContext context) {
    CryRecordController controller = Get.find();
    return Obx(
      () => Column(
        children: [
          SizedBox(
            height: 25,
            child: ListView.separated(
                shrinkWrap: true,
                padding:
                    EdgeInsetsDirectional.only(start: AppConstant.BODY_PADDING),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) => InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () => controller
                          .selectedMonth(getMonth(controller.monthList[i])),
                      child: Text(
                        controller.monthList[i],
                        style: TextStyles.style17Thin.copyWith(
                            color: AppColors.color9A9A9A,
                            fontWeight: controller.selectedMonth.value ==
                                    getMonth(controller.monthList[i])
                                ? FontWeight.w600
                                : FontWeight.w300),
                      ),
                    ),
                separatorBuilder: (_, i) => small15HorizontalSpace(),
                itemCount: controller.monthList.length),
          ),
          small5VerticalSpace(),
          SizedBox(
              height: 90,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppConstant.BODY_PADDING),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    controller.dayList.length,
                    (i) => GestureDetector(
                      onTap: () =>
                          controller.selectedDate(controller.dayList[i].date),
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(43),
                                color: controller.selectedDate.value ==
                                        controller.dayList[i].date
                                    ? AppColors.primaryBlue
                                    : AppColors.colorEBEBEB),
                            width: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  controller.dayList[i].day,
                                  style: TextStyles.style10Thin.copyWith(
                                      color: controller.selectedDate.value ==
                                              controller.dayList[i].date
                                          ? AppColors.white
                                          : AppColors.color9A9A9A),
                                ),
                                Text(
                                  controller.dayList[i].date.toString(),
                                  style: TextStyles.style17Thin.copyWith(
                                      color: controller.selectedDate.value ==
                                              controller.dayList[i].date
                                          ? AppColors.white
                                          : AppColors.color9A9A9A,
                                      fontWeight:
                                          controller.selectedDate.value ==
                                                  controller.dayList[i].date
                                              ? FontWeight.w700
                                              : FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          if (controller.selectedDate.value ==
                              controller.dayList[i].date)
                            Positioned(
                              right: 0,
                              left: 0,
                              top: 0,
                              child: Container(
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.accentOrange),
                                width: 12,
                                height: 12,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
