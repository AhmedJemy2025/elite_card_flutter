import 'package:art_core/theme/styles.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DateTimeHelper {
 static void openDateTimePicker(Function(dynamic dateTime) onSelectDateTime,
      {String? title, DateTime? initialTime}) {
    BottomPicker.dateTime(

      title: title ?? 'date_time'.tr(),
      dateOrder: DatePickerDateOrder.ymd,
      minDateTime: initialTime ?? DateTime.now(),
      // initialDateTime: initialTime,
      buttonText: 'submit'.tr(),
      buttonSingleColor: colorWhite,
      dismissable: true,
      displayButtonIcon: false,
      buttonAlignement: MainAxisAlignment.center,
      buttonTextStyle: TextStyle(
          color: iconColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          wordSpacing: 100),
      pickerTextStyle: TextStyle(
        color: iconColor,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: iconColor,
      ),
      // onChange: onSelectDateTime ,
      onSubmit: onSelectDateTime,
      // height: MediaQuery.of(context).size.height * .4,
    ).show(Modular.routerDelegate.navigatorKey.currentContext!);
  }

  void openDatePicker(Function(dynamic dateTime) onSelectDateTime,
      {String? title, DateTime? initialTime}) {
    BottomPicker.date(
      title: title ?? 'choose_date'.tr(),
      dateOrder: DatePickerDateOrder.ymd,
      minDateTime: initialTime ?? DateTime.now(),
      // initialDateTime: initialTime,
      buttonText: 'submit'.tr(),
      buttonSingleColor: colorWhite,
      dismissable: true,
      displayButtonIcon: false,
      buttonAlignement: MainAxisAlignment.center,
      buttonTextStyle: TextStyle(
          color: iconColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          wordSpacing: 100),
      pickerTextStyle: TextStyle(
        color: iconColor,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: iconColor,
      ),
      // onChange: onSelectDateTime ,
      onSubmit: onSelectDateTime,
      // height: MediaQuery.of(context).size.height * .4,
    ).show(Modular.routerDelegate.navigatorKey.currentContext!);
  }

  String dateTimeConverter(String dateTime){
   return DateTime.parse(dateTime.toString()).subtract(DateTime.now().timeZoneOffset).toString();
  }

}
