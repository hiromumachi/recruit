import 'dart:ui';

import 'package:clock/clock.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static const localeObject = Locale('ja', 'JP');
  static const locale = 'ja_JP';
  static const format = 'yyyy/MM/dd HH:mm';
  static const formatWithoutYear = 'MM/dd H:mm';

  static DateTime? fromString(String? date) {
    if (date == null) return null;
    return DateTime.parse(date).toLocal();
  }

  static DateTime? fromFormatString(String? date) {
    if (date == null) return null;
    final dateFormat = DateFormat(format);
    return dateFormat.parse(date).toLocal();
  }

  static String parse(DateTime datetime) {
    return DateFormat(format, locale).format(datetime);
  }

  static int getDifferenceSecond(DateTime? date) {
    if (date == null) return 0;
    final now = clock.now();
    return date.difference(now).inSeconds;
  }
}
