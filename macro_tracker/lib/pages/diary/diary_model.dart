import '/backend/backend.dart';
import '/components/food_item_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DiaryModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // State field(s) for PageView widget.
  PageController? pageViewController1;
  // Model for foodItem component.
  late FoodItemModel foodItemModel1;
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
    foodItemModel1 = createModel(context, () => FoodItemModel());
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  void dispose() {
    foodItemModel1.dispose();
    streamSubscriptions.forEach((s) => s?.cancel());
  }

  /// Additional helper methods are added here.

}
