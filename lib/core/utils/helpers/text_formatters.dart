import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String thousandFormatter(var number) {
  final formatter = NumberFormat("#,###");
  return formatter.format(number);
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class ExcludeArabicLettersFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Implement your logic to exclude Arabic letters from the input
    String filteredText = newValue.text.replaceAll(RegExp(r'[؀-ۿ]'), '');

    // Return the updated text editing value
    return TextEditingValue(
      text: filteredText,
      selection: newValue.selection,
    );
  }
}

// Color getColorForNumber(int number) {
//   Color color;
//   switch (number) {
//     case int n when (n >= 0 && n <= 49999):
//       color = Colors.green;
//       break;
//     case int n when (n >= 50000 && n <= 199999):
//       color = Colors.blue;
//       break;
//     case int n when (n >= 200000 && n <= 499999):
//       color = Colors.orange;
//       break;
//     case int n when (n >= 500000 && n <= 10000000):
//       color = Colors.red;
//       break;
//     default:
//       color = Colors.black;
//       break;
//   }
//   return color;
// }

String replaceHindiNumeralsWithArabic(String input) {
  return input
      .replaceAll('١', '1')
      .replaceAll('٢', '2')
      .replaceAll('٣', '3')
      .replaceAll('٤', '4')
      .replaceAll('٥', '5')
      .replaceAll('٦', '6')
      .replaceAll('٧', '7')
      .replaceAll('٨', '8')
      .replaceAll('٩', '9')
      .replaceAll('٠', '0')
      .replaceAll('يناير', 'كانون الثاني')
      .replaceAll('فبراير', 'شباط')
      .replaceAll('مارس', 'آذار')
      .replaceAll('أبريل', 'نيسان')
      .replaceAll('مايو', 'أيار')
      .replaceAll('يونيو', 'حزيران')
      .replaceAll('يوليو', 'تموز')
      .replaceAll('أغسطس', 'آب')
      .replaceAll('سبتمبر', 'أيلول')
      .replaceAll('أكتوبر', 'تشرين الأول')
      .replaceAll('نوفمبر', 'تشرين الثاني')
      .replaceAll('ديسمبر', 'كانون الأول');
}

getFormattedDate(String date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final tomorrow = DateTime(now.year, now.month, now.day + 1);

  // Get the current date and time
  DateTime parsedDate = (DateTime.parse(date.replaceAll('/', '-')));

  // Create a DateFormat instance with the desired format and locale
  // DateFormat formatter = DateFormat('yyyy/MM/dd', 'ar');
  DateFormat formatter = DateFormat('EEEE, d MMMM y', 'ar');

  // Format the current date
  String formattedDate = formatter.format(parsedDate);

  String dateText;
  final aDate = DateTime(parsedDate.year, parsedDate.month, parsedDate.day);

  // Determine the word representation of the date
  if (aDate == today) {
    dateText = 'اليوم, $formattedDate';
  } else if (aDate == yesterday) {
    dateText = 'البارحة, $formattedDate';
  } else if (aDate == tomorrow) {
    dateText = 'غداً, $formattedDate';
  } else {
    dateText = formattedDate;
  }

  // return dateText; // Output: Tue, Wed, .. Today, Yesterday, etc...
  return replaceHindiNumeralsWithArabic(dateText);
}

String getTimeIn12HourFormat(String timeString) {
  // Split the input time string into hours, minutes, and seconds.
  List<String> timeParts = timeString.split(':');
  int hours = int.parse(timeParts[0]);
  int minutes = int.parse(timeParts[1]);
  // int seconds = int.parse(timeParts[2]);

  // Check if the time is after noon (PM) or before noon (AM).
  String period = (hours >= 12) ? 'PM' : 'AM';

  // Convert the hours to 12-hours format.
  int hoursIn12HourFormat = hours % 12;
  if (hoursIn12HourFormat == 0) {
    hoursIn12HourFormat = 12; // 12:00:00 should be represented as 12:00:00 PM
  }

  // Create the formatted time string in 12-hours mode.
  String formattedTime =
      '$hoursIn12HourFormat:${minutes.toString().padLeft(2, '0')} $period';

  // :${seconds.toString().padLeft(2, '0')} $period';

  return formattedTime;
}

String convertDateTimeToArabic(
  String dateTimePattern, {
  bool isLimitedToHours = false,
}) {
  // Split the date and time pattern
  List<String> dateTimeParts = dateTimePattern.split(' ');
  String datePattern = dateTimeParts[0];
  String timePattern = dateTimeParts[1];

  // Split the time pattern into hours, minutes, and seconds
  List<String> timeParts = timePattern.split(':');
  int hours = int.parse(timeParts[0]);
  int minutes = int.parse(timeParts[1]);
  int seconds = int.parse(timeParts[2]);

  // Split the date pattern into year, month, and day
  List<String> dateParts = datePattern.split('/');
  int year = int.parse(dateParts[0]);
  int month = int.parse(dateParts[1]);
  int day = int.parse(dateParts[2]);

  // Create a DateTime object for the given date and time
  DateTime givenTime = DateTime(year, month, day, hours, minutes, seconds);

  // Get the current time
  DateTime now = DateTime.now();

  // Calculate the time difference
  Duration difference = now.difference(givenTime).abs();

  // Extract the difference in years, months, days, hours, minutes, and seconds
  int diffYears = (difference.inDays / 365).floor();
  int diffMonths = (difference.inDays % 365 / 30).floor();
  int diffDays = difference.inDays % 365 % 30;
  int diffHours = difference.inHours.remainder(24);
  int diffMinutes = difference.inMinutes.remainder(60);
  // int diffSeconds = difference.inSeconds.remainder(60);

  // Construct the result string
  String result = 'قبل';
  if (diffYears > 0) {
    result += ' $diffYears سنة,';
  }
  if (diffMonths > 0) {
    result += ' $diffMonths شهر,';
  }
  if (diffDays > 0) {
    result += ' $diffDays يوم,';
  }
  if (diffHours > 0) {
    result += ' $diffHours ساعة';
  }
  if (diffMinutes > 0 && !isLimitedToHours) {
    result += ' ,$diffMinutes دقيقة';
  }
  // if (diffSeconds > 0) {
  //   result += ' $diffSeconds ثانية';
  // }
  if (result == 'قبل') {
    return 'الآن';
  }
  return result;
}

bool isDateTimeMatched(String dateTimeStr1, String dateTimeStr2) {
  try {
    // Define the format of the datetime strings
    DateFormat format = DateFormat("yyyy/MM/dd HH:mm:ss");

    // Parse the datetime strings into DateTime objects
    DateTime dt1 = format.parse(dateTimeStr1);
    DateTime dt2 = format.parse(dateTimeStr2);

    // Compare the DateTime objects
    return dt1.isAtSameMomentAs(dt2);
  } catch (e) {
    // Return false if parsing fails
    return false;
  }
}

class MyThousandsFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Define a mapping from Hindi numerals to Arabic numerals
    final Map<String, String> numeralMapping = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };

    // Replace Hindi numerals with Arabic numerals in the new value
    String convertedText = newValue.text;
    numeralMapping.forEach((hindiNumeral, arabicNumeral) {
      convertedText = convertedText.replaceAll(hindiNumeral, arabicNumeral);
    });

    // Remove commas and format as thousands
    final unformattedText = convertedText.replaceAll(',', '');
    final formattedText = NumberFormat.decimalPattern()
        .format(int.tryParse(unformattedText) ?? 0);

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

// Check the text if it's in Arabic or English
bool containsArabic(String text) {
  for (int i = 0; i < text.length; i++) {
    int charCode = text.codeUnitAt(i);
    if ((charCode >= 0x0600 && charCode <= 0x06FF) || // Arabic characters
        (charCode >= 0x0750 &&
            charCode <= 0x077F) || // Arabic Supplement characters
        (charCode >= 0xFB50 &&
            charCode <= 0xFDFF) || // Arabic Presentation Forms-B
        (charCode >= 0xFE70 &&
            charCode <= 0xFEFF) || // Arabic Presentation Forms-A
        (charCode >= 0x1EE00 && charCode <= 0x1EEFF)) {
      // Arabic Mathematical Alphabetic Symbols
      return true;
    }
  }
  return false;
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var inputText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return newValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}

String getGreeting() {
  DateTime now = DateTime.now();
  int hour = now.hour;

  if (hour >= 5 && hour < 12) {
    return 'Good morning';
  } else if (hour >= 12 && hour < 17) {
    return 'Good afternoon';
  } else if (hour >= 17 && hour < 21) {
    return 'Good evening';
  } else {
    return 'Good night';
  }
}
