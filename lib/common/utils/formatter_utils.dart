import 'package:intl/intl.dart';

// ignore: avoid_classes_with_only_static_members
class Formatter {
  // static DateFormat date() => DateFormat('dd MMMM yyyy', 'ru');
  // static DateFormat yyyyMMdd = DateFormat('yyyy-MM-dd', 'ru');
  // static DateFormat ddMMyyyy = DateFormat('dd.MM.yyyy', 'ru');
  // static DateFormat ddMMyy = DateFormat('dd.MM.yy', 'ru');

  static String stringDateFormatter(String date) {
    final dateTime = DateTime.tryParse(date);
    if (dateTime != null) {
      final formattedDate = DateFormat('dd.MM.yyyy').format(dateTime);
      return formattedDate;
    } else {
      return '';
    }
  }

  // static String requestDateFormatter(String date) {
  //   final dateTime = DateTime.parse(date);
  //   final formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  //   return formattedDate;
  // }

  static String longTextFormatter(String text) {
    final pattern = RegExp(r'\[\+\d+ chars\]');

    final result = text.replaceAll(pattern, '');

    return result;
  }
}

// DateTime dateFormat(String date) {
//   return DateFormat('yyyy-MM-dd').parse(date);
// }

// String dateToString(DateTime date) {
//   return DateFormat.yMd('ru').format(date);
// }
