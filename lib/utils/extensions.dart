
import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String get readableDate => DateFormat.yMMMMEEEEd().format(toLocal());

  String get readableDateOnly {
    String getOrdinalSuffix(int day) {
      if (day >= 11 && day <= 13) {
        return '${day}th';
      }
      switch (day % 10) {
        case 1:
          return '${day}st';
        case 2:
          return '${day}nd';
        case 3:
          return '${day}rd';
        default:
          return '${day}th';
      }
    }

    String formatCustomDate(DateTime date) {
      String day = DateFormat('d').format(date);
      String month = DateFormat('MMMM').format(date);
      String year = DateFormat('y').format(date);

      // Create a function to add the ordinal suffix to the day
      String ordinalDay = getOrdinalSuffix(int.parse(day));

      // Combine the components to form the desired format
      return '$ordinalDay $month $year';
    }

    return formatCustomDate(toLocal());
  }

  String get readableTime => DateFormat().add_Hm().format(toLocal());

  String get timeOnly => DateFormat("h:mm a").format(toLocal());

  String get dateOnly => DateFormat("yyyy-MM-dd").format(toLocal());

  String get readableDateTime => DateFormat.yMMMMEEEEd().add_Hms().format(toLocal());

  String get dateTimeOnly => DateFormat("EEEE d, h:mm a").format(toLocal());

  static DateTime? fromString(
      String? dateStr, {
        String originalDateFormat = "MM/dd/yyyy hh:mm:ss a",
      }) {
    if (dateStr == null) return null;
    try {
      return DateFormat(originalDateFormat).parse(dateStr);
    } catch (e) {
      print("Invalid date format $dateStr");
      return null;
    }
  }
}
