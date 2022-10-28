extension DateExtension on DateTime {
  String get monthAsString {
    final map = <int, String>{
      DateTime.january: 'Ocak',
      DateTime.february: 'Şubat',
      DateTime.march: 'Mart',
      DateTime.april: 'Nisan',
      DateTime.may: 'Mayıs',
      DateTime.june: 'Haziran',
      DateTime.july: 'Temmuz',
      DateTime.august: 'Ağustos',
      DateTime.september: 'Eylül',
      DateTime.october: 'Ekim',
      DateTime.november: 'Kasım',
      DateTime.december: 'Aralık',
    };
    return map[month] ?? month.toString();
  }

  String get weekdayAsString {
    final map = <int, String>{
      DateTime.monday: 'Pazartesi',
      DateTime.tuesday: 'Salı',
      DateTime.wednesday: 'Çarşamba',
      DateTime.thursday: 'Perşembe',
      DateTime.friday: 'Cuma',
      DateTime.saturday: 'Cumartesi',
      DateTime.sunday: 'Pazar',
    };
    return map[weekday] ?? weekday.toString();
  }

  String get getDMY => "$day.${month < 10 ? ("0$month") : month}.$year";
}
