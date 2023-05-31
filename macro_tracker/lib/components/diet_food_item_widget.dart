import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:health/health.dart';

import 'package:macro_tracker/auth/firebase_auth/auth_util.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_icon_button.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_theme.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:macro_tracker/components/diet_food_item_model.dart';
import 'package:macro_tracker/services/health_service.dart';
export 'package:macro_tracker/components/diet_food_item_model.dart';

class DietFoodItemWidget extends StatefulWidget {
  final DietFoodItemModel dietFoodItemModel;
  const DietFoodItemWidget({Key? key, required this.dietFoodItemModel})
      : super(key: key);

  @override
  _DietFoodItemWidgetState createState() => _DietFoodItemWidgetState();
}

class _DietFoodItemWidgetState extends State<DietFoodItemWidget> {
  late DietFoodItemModel _model;

  int stringCutoff = 24;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = widget.dietFoodItemModel;
    _model.onUpdate();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Text(
                      getMealIcon(_model.meal),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            fontSize: 36.0,
                          ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ('${_model.name}'.length <= stringCutoff)
                            ? '${_model.name}'
                            : '${'${_model.name}'.substring(0, stringCutoff)}...',
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                      Text(
                        '${_model.kcal} Kcal ${_model.carbs}C ${_model.proteins}P ${_model.fats}F',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 46.0,
                    icon: Icon(
                      Icons.mode_edit,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 28.0,
                    ),
                    onPressed: () async {
                      addFoodToTemp();
                      removeFoodFromDiet();
                      context.goNamed('editDietFood');
                    },
                  ),
                  FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 46.0,
                    icon: Icon(
                      Icons.add_circle_outline_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 28.0,
                    ),
                    onPressed: () async {
                      addFoodToDiary();
                      context.goNamed('Diary');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addFoodToTemp() async {
    final firestore = FirebaseFirestore.instance;
    //documentId is equal to the timestamp of the food
    int documentId = _model.datetime.millisecondsSinceEpoch;

    await firestore
        .collection('users')
        .doc(currentUserDocument?.uid)
        .collection('temp')
        .doc(documentId.toString())
        .set({
      'name': _model.name,
      'kcal': _model.kcal,
      'carbs': _model.carbs,
      'proteins': _model.proteins,
      'fats': _model.fats,
      'meal': _model.meal,
      'quantity': _model.quantity,
      'datetime': _model.datetime,
      'id': _model.id,
    });
  }

  void removeFoodFromDiet() async {
    final firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .doc(currentUserDocument?.uid)
        .collection('diet_foods')
        .where("id", isEqualTo: _model.id)
        .limit(1)
        .get();

    DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
    DocumentReference documentReference = documentSnapshot.reference;

    await documentReference.delete();
  }

  void addFoodToDiary() async {
    final firestore = FirebaseFirestore.instance;
    //documentId is equal to the timestamp of the food
    int documentId = _model.datetime.millisecondsSinceEpoch;
    DateTime now = DateTime.now();

    await firestore
        .collection('users')
        .doc(currentUserDocument?.uid)
        .collection('foods')
        .doc(documentId.toString())
        .set({
      'name': _model.name,
      'kcal': _model.kcal,
      'carbs': _model.carbs,
      'proteins': _model.proteins,
      'fats': _model.fats,
      'meal': _model.meal,
      'quantity': _model.quantity,
      'datetime': now,
      'id': _model.id,
    });

    final healthService = HealthService();
    await healthService.addToHealth(
          double.parse(_model.kcal) *
              (double.parse(_model.kcal) / 100),
          HealthDataType.DIETARY_ENERGY_CONSUMED,
          now);
      await healthService.addToHealth(
          double.parse(_model.carbs) *
              (double.parse(_model.carbs) / 100),
          HealthDataType.DIETARY_CARBS_CONSUMED,
          now);
      await healthService.addToHealth(
          double.parse(_model.proteins) *
              (double.parse(_model.proteins) / 100),
          HealthDataType.DIETARY_PROTEIN_CONSUMED,
          now);
      await healthService.addToHealth(
          double.parse(_model.fats) *
              (double.parse(_model.fats) / 100),
          HealthDataType.DIETARY_FATS_CONSUMED,
          now);
  }

  String getMealIcon(String meal) {
    switch (meal) {
      case 'Breakfast':
        return '🥐';
      case 'Lunch':
        return '🍜';
      case 'Dinner':
        return '🥘';
      case 'Snack':
        return '🍎';
      default:
        return '';
    }
  }
}
