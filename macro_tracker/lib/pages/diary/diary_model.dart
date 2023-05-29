import 'package:macro_tracker/backend/backend.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_calendar.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class DiaryModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // State field(s) for PageView widget.
  PageController? pageViewController1;
  // State field(s) for calendar widget.
  DateTimeRange? calendarSelectedDay2;
  // State field(s) for PageView widget.
  PageController? pageViewController2;
  // State field(s) for ListView widget.
  PagingController<DocumentSnapshot?, FoodsRecord>? pagingController;
  Query? pagingQuery;
  List<StreamSubscription?> streamSubscriptions = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calendarSelectedDay1 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  void dispose() {
    streamSubscriptions.forEach((s) => s?.cancel());
  }

  /// Additional helper methods are added here.
}
