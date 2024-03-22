
import 'package:get/get.dart';
import 'package:ubenwa_peter/helpers/day_fromatter.dart';
import 'package:ubenwa_peter/models/day_model.dart';

class CryRecordController extends GetxController {
  RxInt selectedDate = 0.obs;
  RxInt selectedMonth = 0.obs;
  RxString selectedCategory = ''.obs;

  RxList monthList = [].obs;
  RxList<DayModel> dayList = <DayModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    selectedMonth(DateTime.now().month);
    selectedDate(DateTime.now().day);
    generateMonthList();
    generateDayList(selectedDate.value, selectedMonth.value);
    super.onInit();
  }

  generateMonthList() {
    List<String> monthsTilePresent = [];

    for (int i = 1; i < 13; i++) {
      monthsTilePresent.add(getMonthName(i));
    }
    monthList(monthsTilePresent);
  }

  generateDayList(int today, int month) {
    List<DayModel> daysTilePresent = [];

    for (int i = today - 3; i < today + 4; i++) {
      daysTilePresent.add(getDay(i, month));
    }

    dayList(daysTilePresent);
  }
}
