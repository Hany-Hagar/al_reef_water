import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateService {
  static String formatDate(BuildContext context, DateTime inputDate) {
    final now = DateTime.now();
    
    // Clear time components to compare calendar days accurately
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final compareDate = DateTime(inputDate.year, inputDate.month, inputDate.day);

    // Look up the current locale language code (e.g., 'ar' or 'en')
    final String locale = Localizations.localeOf(context).languageCode;
    
    // 1. Check if the date is Today
    if (compareDate.isAtSameMomentAs(today)) {
      return locale == 'ar' ? 'اليوم' : 'Today';
    }

    // 2. Check if the date is Yesterday
    if (compareDate.isAtSameMomentAs(yesterday)) {
      // Direct native strings for safety across standard locales
      return locale == 'ar' ? 'الأمس' : 'Yesterday';
    }

    // 3. Custom formatting for other dates (e.g., 14 May 2026 / 14 مايو 2026)
    // 'd MMMM yyyy' handles localized month names automatically via the intl package
    final formatter = DateFormat('d MMMM yyyy', locale);
    return formatter.format(inputDate);
  }
}
