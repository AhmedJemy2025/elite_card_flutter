import 'package:core/core.dart';
import 'package:intl/intl.dart';

extension TimeDate on String {
  String get time {
    DateTime? dateTime = DateTime.tryParse(this);
    if (dateTime != null) {
      return DateFormat.jm( PreferenceManager().currentLang() ).format(dateTime).toString();
    } else {
      return this;
    }
  }

  String get date {
    DateTime? dateTime = DateTime.tryParse(this);
    if (dateTime != null) {
      return DateFormat.yMd(
              PreferenceManager().currentLang() == 'ar' ? 'ar' : 'en')
          .format(dateTime)
          .toString();
    } else {
      return this;
    }
  }

  String get dateEN {
    DateTime? dateTime = DateTime.tryParse(this);
    if (dateTime != null) {
      return DateFormat.yMd(
           'en')
          .format(dateTime)
          .toString();
    } else {
      return this;
    }
  }
  String get dateTime {
    DateTime? dateTime = DateTime.tryParse(this);
    if (dateTime != null) {
      return DateFormat('yyyy-MM-dd kk:mm:a', PreferenceManager().currentLang())
          .format(dateTime)
          .toString();
    } else {
      return this;
    }
  }

  String get dateTimeSocial {
    DateTime? dateTime = DateTime.tryParse(this);
    if (dateTime != null) {
      return DateFormat(
              'dd-MM-yyyy - hh:mm:a', PreferenceManager().currentLang())
          .format(dateTime.add(DateTime.now().timeZoneOffset))
          .toString();
    } else {
      return this;
    }
  }

  String get dateWithMonthName {
    DateTime? dateTime = DateTime.tryParse(this);
    if (dateTime != null) {
      return DateFormat.yMMMMd(
              PreferenceManager().currentLang() == 'ar' ? 'ar-SA' : 'en_US')
          .format(dateTime)
          .toString();
    } else {
      return this;
    }
  }
}

extension TranslatAmPm on String {
  String translate() {
    return PreferenceManager().currentLang() == 'ar'
        ? replaceAll('AM', 'ص').replaceAll('PM', 'م')
        : this;
  }
}
