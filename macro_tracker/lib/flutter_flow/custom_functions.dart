import 'package:flutter/material.dart';

DateTimeRange? getTodayInterval() {
  final DateTime now = DateTime.now();
  final DateTime startOfToday = DateTime(now.year, now.month, now.day);
  final DateTime endOfToday =
      startOfToday.add(Duration(days: 1)).subtract(Duration(milliseconds: 1));

  return DateTimeRange(start: startOfToday, end: endOfToday);
}
