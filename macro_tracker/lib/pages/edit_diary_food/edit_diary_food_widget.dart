import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:health/health.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:macro_tracker/components/food_item_widget.dart';
import 'package:macro_tracker/services/health_service.dart';
import 'package:macro_tracker/auth/firebase_auth/auth_util.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_choice_chips.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_icon_button.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_theme.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_util.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_widgets.dart';
import 'package:macro_tracker/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:macro_tracker/pages/edit_diary_food/edit_diary_food_model.dart';

class EditDiaryFoodWidget extends StatefulWidget {
  const EditDiaryFoodWidget({Key? key}) : super(key: key);

  @override
  _EditDiaryFoodWidgetState createState() => _EditDiaryFoodWidgetState();
}

class _EditDiaryFoodWidgetState extends State<EditDiaryFoodWidget> {
  late EditDiaryFoodModel _model;

  bool mobileWidget = true;
  bool tabletWidget = false;

  late FoodItemModel initialValues;
  String initialMealChoice = "";
  int documentId = -1;
  late DateTime datetime;

  final HealthService healthService = HealthService();

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditDiaryFoodModel());

    _model.foodNameController1 ??= TextEditingController();
    _model.kcalController1 ??= TextEditingController();
    _model.carbsController1 ??= TextEditingController();
    _model.proteinsController1 ??= TextEditingController();
    _model.fatsController1 ??= TextEditingController();
    _model.foodQuantityController1 ??= TextEditingController();
    _model.foodNameController2 ??= TextEditingController();
    _model.kcalController2 ??= TextEditingController();
    _model.carbsController2 ??= TextEditingController();
    _model.proteinsController2 ??= TextEditingController();
    _model.fatsController2 ??= TextEditingController();
    _model.foodQuantityController2 ??= TextEditingController();

    initTextFieldsFromDB();
    initializeDBValues();
  }

  Future<void> initTextFieldsFromDB() async {
    final firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .doc(currentUserDocument?.uid)
        .collection('temp')
        .limit(1)
        .get();

    Map<String, dynamic> tempData =
        querySnapshot.docs.first.data() as Map<String, dynamic>;

    _model.foodNameController1.text = tempData['name'];
    _model.kcalController1.text = tempData['kcal'];
    _model.carbsController1.text = tempData['carbs'];
    _model.proteinsController1.text = tempData['proteins'];
    _model.fatsController1.text = tempData['fats'];
    _model.foodQuantityController1.text = tempData['quantity'];

    _model.foodNameController2.text = tempData['name'];
    _model.kcalController2.text = tempData['kcal'];
    _model.carbsController2.text = tempData['carbs'];
    _model.proteinsController2.text = tempData['proteins'];
    _model.fatsController2.text = tempData['fats'];
    _model.foodQuantityController2.text = tempData['quantity'];

    initialMealChoice = getChipValueFromMeal(tempData['meal']);
    documentId = tempData['id'];
    datetime = (tempData['datetime'] as Timestamp).toDate();
  }

  void initializeDBValues() async {
    final firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .doc(currentUserDocument?.uid)
        .collection('temp')
        .limit(1)
        .get();

    Map<String, dynamic> tempData =
        querySnapshot.docs.first.data() as Map<String, dynamic>;

    initialValues = FoodItemModel(
      carbs: tempData["carbs"],
      fats: tempData['fats'],
      proteins: tempData['proteins'],
      kcal: tempData['kcal'],
      name: tempData['name'],
      meal: tempData['meal'],
      quantity: tempData['quantity'],
      datetime: (tempData['datetime'] as Timestamp).toDate(),
      id: tempData['id'],
    );
  }

  String getChipValueFromMeal(String meal) {
    switch (meal) {
      case 'Breakfast':
        return '🥐 Breakfast';
      case 'Lunch':
        return '🍜 Lunch';
      case 'Dinner':
        return '🥘 Dinner';
      case 'Snack':
        return '🍎 Snack';
      default:
        return '';
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
      child: FutureBuilder(
          future: initTextFieldsFromDB(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            return Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Edit food',
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).white,
                          ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.delete,
                        color: FlutterFlowTheme.of(context).white,
                        size: 24.0,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CupertinoAlertDialog(
                                title: const Text('Error'),
                                content: Text(
                                    'Do you really want to delete the food from your diet?'),
                                actions: <CupertinoDialogAction>[
                                  CupertinoDialogAction(
                                    onPressed: () {
                                      Navigator.pop(context, false);
                                    },
                                    child: Text(
                                      'No',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                  CupertinoDialogAction(
                                    onPressed: () {
                                      removeFoodFromHealth();
                                      removeFoodFromTemp();
                                      context.goNamed('Diary');
                                    },
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            });
                      },
                    ),
                  ],
                ),
                actions: [],
                centerTitle: false,
                elevation: 0.0,
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        tablet: false,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    70.0, 20.0, 70.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                        child: buildTextFieldFromFirestore(
                                            _model.foodNameController1,
                                            "_model.foodNameController1",
                                            'name',
                                            _model
                                                .foodNameController1Validator)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    70.0, 20.0, 70.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: buildTextFieldFromFirestore(
                                          _model.kcalController1,
                                          "_model.kcalController1",
                                          "kcal",
                                          _model.kcalController1Validator),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '/ 100 g',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    70.0, 20.0, 70.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: buildTextFieldFromFirestore(
                                          _model.carbsController1,
                                          "_model.carbsController1",
                                          "carbs",
                                          _model.carbsController1Validator),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '/ 100 g',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    70.0, 20.0, 70.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: buildTextFieldFromFirestore(
                                          _model.proteinsController1,
                                          "_model.proteinsController1",
                                          "proteins",
                                          _model.proteinsController1Validator),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '/ 100 g',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    70.0, 20.0, 70.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: buildTextFieldFromFirestore(
                                          _model.fatsController1,
                                          "_model.fatsController1",
                                          "fats",
                                          _model.fatsController1Validator),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '/ 100 g',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    70.0, 20.0, 105.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: buildTextFieldFromFirestore(
                                          _model.foodQuantityController1,
                                          "_model.foodQuantityController1",
                                          "quantity",
                                          _model
                                              .foodQuantityController1Validator),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'g',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 25.0, 10.0, 0.0),
                                child: buildChoiceChips(mobileWidget),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        removeFoodFromTemp();
                                        addToFoodsWithoutChanges();
                                        context.goNamed('Diary');
                                      },
                                      text: 'Cancel',
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                            ),
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if (textFieldsAlert(mobileWidget)) {
                                          context.goNamed('Diary');
                                          updateFood(mobileWidget);
                                        }
                                      },
                                      text: 'Confirm',
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                            ),
                                        borderSide: BorderSide(
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                      ))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 0.0, 50.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    70.0, 20.0, 70.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: buildTextFieldFromFirestore(
                                          _model.foodNameController2,
                                          "_model.foodNameController2",
                                          "name",
                                          _model.foodNameController2Validator),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    70.0, 20.0, 70.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: buildTextFieldFromFirestore(
                                          _model.kcalController2,
                                          "_model.kcalController2",
                                          "kcal",
                                          _model.kcalController2Validator),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '/ 100 g',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    70.0, 20.0, 70.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: buildTextFieldFromFirestore(
                                          _model.carbsController2,
                                          "_model.carbsController2",
                                          "carbs",
                                          _model.carbsController2Validator),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '/ 100 g',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    70.0, 20.0, 70.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: buildTextFieldFromFirestore(
                                          _model.proteinsController2,
                                          "_model.proteinsController2",
                                          "proteins",
                                          _model.proteinsController2Validator),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '/ 100 g',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    70.0, 20.0, 70.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: buildTextFieldFromFirestore(
                                          _model.fatsController2,
                                          "_model.fatsController2",
                                          "fats",
                                          _model.fatsController2Validator),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        '/ 100 g',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    70.0, 20.0, 110.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: buildTextFieldFromFirestore(
                                          _model.foodQuantityController2,
                                          "_model.quantityController2",
                                          "quantity",
                                          _model
                                              .foodQuantityController2Validator),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'g',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 16.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 25.0, 10.0, 0.0),
                                child: buildChoiceChips(tabletWidget),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        removeFoodFromTemp();
                                        addToFoodsWithoutChanges();
                                        context.goNamed('Diary');
                                      },
                                      text: 'Cancel',
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                            ),
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if (textFieldsAlert(tabletWidget)) {
                                          context.goNamed('Diary');
                                          updateFood(tabletWidget);
                                        }
                                      },
                                      text: 'Confirm',
                                      options: FFButtonOptions(
                                        width: 130.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 16.0,
                                            ),
                                        borderSide: BorderSide(
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }));

  StatefulWidget buildChoiceChips(bool isMobile) {
    if (isMobile) {
      if (initialMealChoice == "") {
        return CircularProgressIndicator();
      } else {
        _model.mealChoiceChipsValue1 = initialMealChoice;

        return FlutterFlowChoiceChips(
          options: [
            ChipData('🥐 Breakfast'),
            ChipData('🍜 Lunch'),
            ChipData('🥘 Dinner'),
            ChipData('🍎 Snack'),
          ],
          onChanged: (val) {
            setState(() => _model.mealChoiceChipsValue1 = val?.first);
            updateFirestoreValue(
                'meal', _model.mealChoiceChipsValue1!.split(" ")[1]);
          },
          selectedChipStyle: ChipStyle(
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
            iconColor: FlutterFlowTheme.of(context).primaryText,
            iconSize: 18.0,
            elevation: 4.0,
          ),
          unselectedChipStyle: ChipStyle(
            backgroundColor: FlutterFlowTheme.of(context).accent4,
            textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
            iconColor: FlutterFlowTheme.of(context).primaryText,
            iconSize: 18.0,
            elevation: 4.0,
          ),
          chipSpacing: 10.0,
          multiselect: false,
          alignment: WrapAlignment.start,
          controller: _model.mealChoiceChipsValueController1 ??=
              FormFieldController<List<String>>(
            [initialMealChoice],
          ),
        );
      }
    } else {
      if (initialMealChoice == "") {
        return CircularProgressIndicator();
      } else {
        _model.mealChoiceChipsValue2 = initialMealChoice;

        return FlutterFlowChoiceChips(
          options: [
            ChipData('🥐 Breakfast'),
            ChipData('🍜 Lunch'),
            ChipData('🥘 Dinner'),
            ChipData('🍎 Snack')
          ],
          onChanged: (val) {
            setState(() => _model.mealChoiceChipsValue2 = val?.first);
            updateFirestoreValue(
                'meal', _model.mealChoiceChipsValue2!.split(" ")[1]);
          },
          selectedChipStyle: ChipStyle(
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 18.0,
                ),
            iconColor: FlutterFlowTheme.of(context).primaryText,
            iconSize: 18.0,
            elevation: 4.0,
          ),
          unselectedChipStyle: ChipStyle(
            backgroundColor: FlutterFlowTheme.of(context).accent4,
            textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 16.0,
                ),
            iconColor: FlutterFlowTheme.of(context).primaryText,
            iconSize: 18.0,
            elevation: 4.0,
          ),
          chipSpacing: 30.0,
          multiselect: false,
          alignment: WrapAlignment.start,
          controller: _model.mealChoiceChipsValueController2 ??=
              FormFieldController<List<String>>(
            [initialMealChoice],
          ),
        );
      }
    }
  }

  Widget buildTextFieldFromFirestore(
    TextEditingController? controller,
    String controllerName,
    String field,
    String? Function(BuildContext, String?)? controllerValidator,
  ) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(currentUserDocument?.uid)
          .collection('temp')
          .limit(1)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          QuerySnapshot<Map<String, dynamic>> querySnapshot = snapshot.data!;
          if (querySnapshot.size > 0) {
            Map<String, dynamic> data = querySnapshot.docs.first.data();
            final fieldValue = data[field] ?? '';
            if (controller!.text != fieldValue) {
              // Only update the controller's text if it's different from the fieldValue
              final currentText = controller.text;
              final newText = fieldValue.replaceFirst(currentText, '');
              controller.value = controller.value.copyWith(
                text: fieldValue,
                selection: TextSelection.collapsed(offset: fieldValue.length),
                composing: TextRange.empty,
              );
              if (newText.isNotEmpty) {
                // Insert the new text at the end of the existing text
                final selection = controller.selection;
                final updatedText = controller.text + newText;
                final updatedSelection = TextSelection(
                  baseOffset: (selection.baseOffset + newText.length).toInt(),
                  extentOffset:
                      (selection.extentOffset + newText.length).toInt(),
                  affinity: selection.affinity,
                  isDirectional: selection.isDirectional,
                );
                controller.value = controller.value.copyWith(
                  text: updatedText,
                  selection: updatedSelection,
                  composing: TextRange.empty,
                );
              }
            }
          }
        }

        if (controller!.text.isEmpty) {
          return buildTextFormField(
              controller, controllerName, field, controllerValidator);
        } else {
          return buildTextFormField(
              controller, controllerName, field, controllerValidator);
        }
      },
    );
  }

  Widget buildTextFormField(
    TextEditingController? controller,
    String controllerName,
    String field,
    String? Function(BuildContext, String?)? controllerValidator,
  ) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {
        EasyDebounce.debounce(
          controllerName,
          Duration(milliseconds: 2000),
          () {},
        );
      },
      obscureText: false,
      decoration: InputDecoration(
        labelText: capitalizeFirstLetter(field),
        labelStyle: FlutterFlowTheme.of(context).titleSmall.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).primary,
              fontSize: 20.0,
            ),
        hintStyle: FlutterFlowTheme.of(context).titleSmall,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primary,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).secondary,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0x00000000),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.of(context).primaryBackground,
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Outfit',
            fontSize: 20.0,
          ),
      textAlign: field == 'name' ? TextAlign.start : TextAlign.end,
      validator: controllerValidator.asValidator(context),
      inputFormatters: field == 'name'
          ? []
          : [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
      keyboardType: field == 'name' ? TextInputType.text : TextInputType.number,
    );
  }

  void updateFirestoreValue(String field, String value) async {
    final firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .doc(currentUserDocument?.uid)
        .collection('temp')
        .limit(1)
        .get();

    DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
    DocumentReference documentReference = documentSnapshot.reference;

    Map<String, dynamic> updateData = {field: value};

    documentReference.update(updateData);
  }

  void removeFoodFromTemp() async {
    final firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .doc(currentUserDocument?.uid)
        .collection('temp')
        .limit(1)
        .get();

    if (querySnapshot.docs.length != 0) {
      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference documentReference = documentSnapshot.reference;

      await documentReference.delete();
    }
  }

  void removeFoodFromHealth() async {
    await healthService.removeFromHealth(
          HealthDataType.DIETARY_ENERGY_CONSUMED, datetime);
    await healthService.removeFromHealth(
        HealthDataType.DIETARY_CARBS_CONSUMED, datetime);
    await healthService.removeFromHealth(
        HealthDataType.DIETARY_PROTEIN_CONSUMED, datetime);
    await healthService.removeFromHealth(
        HealthDataType.DIETARY_FATS_CONSUMED, datetime);
  }

  void addToFoodsWithoutChanges() async {
    final firestore = FirebaseFirestore.instance;

    await firestore
        .collection('users')
        .doc(currentUserDocument?.uid)
        .collection('foods')
        .doc(initialValues.id.toString())
        .set({
      'name': initialValues.name,
      'kcal': initialValues.kcal,
      'carbs': initialValues.carbs,
      'proteins': initialValues.proteins,
      'fats': initialValues.fats,
      'meal': initialValues.meal,
      'quantity': initialValues.quantity,
      'datetime': initialValues.datetime,
      'id': initialValues.id,
    });

    await healthService.removeFromHealth(
        HealthDataType.DIETARY_ENERGY_CONSUMED, datetime);
    await healthService.removeFromHealth(
        HealthDataType.DIETARY_CARBS_CONSUMED, datetime);
    await healthService.removeFromHealth(
        HealthDataType.DIETARY_PROTEIN_CONSUMED, datetime);
    await healthService.removeFromHealth(
        HealthDataType.DIETARY_FATS_CONSUMED, datetime);

    double quantity = double.parse(initialValues.quantity);

    await healthService.addToHealth(
        double.parse(initialValues.kcal) * (quantity / 100),
        HealthDataType.DIETARY_ENERGY_CONSUMED,
        datetime);
    await healthService.addToHealth(
        double.parse(initialValues.carbs) * (quantity / 100),
        HealthDataType.DIETARY_CARBS_CONSUMED,
        datetime);
    await healthService.addToHealth(
        double.parse(initialValues.proteins) * (quantity / 100),
        HealthDataType.DIETARY_PROTEIN_CONSUMED,
        datetime);
    await healthService.addToHealth(
        double.parse(initialValues.fats) * (quantity / 100),
        HealthDataType.DIETARY_FATS_CONSUMED,
        datetime);
  }

  void updateFood(isMobile) async {
    final firestore = FirebaseFirestore.instance;

    if (isMobile) {
      await firestore
          .collection('users')
          .doc(currentUserDocument?.uid)
          .collection('foods')
          .doc(documentId.toString())
          .set({
        'name': capitalizeFirstLetter(_model.foodNameController1.text),
        'kcal': _model.kcalController1.text,
        'carbs': _model.carbsController1.text,
        'proteins': _model.proteinsController1.text,
        'fats': _model.fatsController1.text,
        'meal': _model.mealChoiceChipsValue1?.split(' ')[1],
        'quantity': _model.foodQuantityController1.text,
        'datetime': datetime,
        'id': documentId,
      });

      await healthService.removeFromHealth(
          HealthDataType.DIETARY_ENERGY_CONSUMED, datetime);
      await healthService.removeFromHealth(
          HealthDataType.DIETARY_CARBS_CONSUMED, datetime);
      await healthService.removeFromHealth(
          HealthDataType.DIETARY_PROTEIN_CONSUMED, datetime);
      await healthService.removeFromHealth(
          HealthDataType.DIETARY_FATS_CONSUMED, datetime);

      await healthService.addToHealth(
          double.parse(_model.kcalController1.text) *
              (double.parse(_model.foodQuantityController1.text) / 100),
          HealthDataType.DIETARY_ENERGY_CONSUMED,
          datetime);
      await healthService.addToHealth(
          double.parse(_model.carbsController1.text) *
              (double.parse(_model.foodQuantityController1.text) / 100),
          HealthDataType.DIETARY_CARBS_CONSUMED,
          datetime);
      await healthService.addToHealth(
          double.parse(_model.proteinsController1.text) *
              (double.parse(_model.foodQuantityController1.text) / 100),
          HealthDataType.DIETARY_PROTEIN_CONSUMED,
          datetime);
      await healthService.addToHealth(
          double.parse(_model.fatsController1.text) *
              (double.parse(_model.foodQuantityController1.text) / 100),
          HealthDataType.DIETARY_FATS_CONSUMED,
          datetime);
    } else {
      await firestore
          .collection('users')
          .doc(currentUserDocument?.uid)
          .collection('foods')
          .doc(documentId.toString())
          .set({
        'name': capitalizeFirstLetter(_model.foodNameController2.text),
        'kcal': _model.kcalController2.text,
        'carbs': _model.carbsController2.text,
        'proteins': _model.proteinsController2.text,
        'fats': _model.fatsController2.text,
        'meal': _model.mealChoiceChipsValue2?.split(' ')[1],
        'quantity': _model.foodQuantityController2.text,
        'datetime': datetime,
        'id': documentId,
      });

      await healthService.removeFromHealth(
          HealthDataType.DIETARY_ENERGY_CONSUMED, datetime);
      await healthService.removeFromHealth(
          HealthDataType.DIETARY_CARBS_CONSUMED, datetime);
      await healthService.removeFromHealth(
          HealthDataType.DIETARY_PROTEIN_CONSUMED, datetime);
      await healthService.removeFromHealth(
          HealthDataType.DIETARY_FATS_CONSUMED, datetime);

      await healthService.addToHealth(
          double.parse(_model.kcalController2.text) *
              (double.parse(_model.foodQuantityController2.text) / 100),
          HealthDataType.DIETARY_ENERGY_CONSUMED,
          datetime);
      await healthService.addToHealth(
          double.parse(_model.carbsController2.text) *
              (double.parse(_model.foodQuantityController2.text) / 100),
          HealthDataType.DIETARY_CARBS_CONSUMED,
          datetime);
      await healthService.addToHealth(
          double.parse(_model.proteinsController2.text) *
              (double.parse(_model.foodQuantityController2.text) / 100),
          HealthDataType.DIETARY_PROTEIN_CONSUMED,
          datetime);
      await healthService.addToHealth(
          double.parse(_model.fatsController2.text) *
              (double.parse(_model.foodQuantityController2.text) / 100),
          HealthDataType.DIETARY_FATS_CONSUMED,
          datetime);
    }

    removeFoodFromTemp();
  }

  String capitalizeFirstLetter(String s) {
    String temp = s[0].toUpperCase();
    return temp + s.substring(1, s.length);
  }

  bool textFieldsAlert(bool isMobile) {
    if (isMobile) {
      if (_model.foodNameController1.text == "" ||
          _model.kcalController1.text == "" ||
          _model.carbsController1.text == "" ||
          _model.proteinsController1.text == "" ||
          _model.fatsController1.text == "" ||
          _model.foodQuantityController1.text == "" ||
          _model.mealChoiceChipsValue1 == null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return CupertinoAlertDialog(
                title: const Text('Alert'),
                content: Text('Please complete all the forms.'),
                actions: <CupertinoDialogAction>[
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primary,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              );
            });

        return false;
      }
    } else {
      if (_model.foodNameController2.text == "" ||
          _model.kcalController2.text == "" ||
          _model.carbsController2.text == "" ||
          _model.proteinsController2.text == "" ||
          _model.fatsController2.text == "" ||
          _model.foodQuantityController2.text == "" ||
          _model.mealChoiceChipsValue2 == null) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Alert'),
                content: Text('Please complete all the forms.'),
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: FlutterFlowTheme.of(context).primary),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
        return false;
      }
    }
    return true;
  }
}
