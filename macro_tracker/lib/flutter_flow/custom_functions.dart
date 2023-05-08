import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/firebase_auth/auth_util.dart';

DateTimeRange? getTodayInterval() {
  final DateTime now = DateTime.now();
  final DateTime startOfToday = DateTime(now.year, now.month, now.day);
  final DateTime endOfToday =
      startOfToday.add(Duration(days: 1)).subtract(Duration(milliseconds: 1));

  return DateTimeRange(start: startOfToday, end: endOfToday);
}
