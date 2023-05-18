import 'package:macro_tracker/backend/backend.dart';

import '../auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'food_item_model.dart';
export 'food_item_model.dart';

class FoodItemWidget extends StatefulWidget {
  final FoodItemModel foodItemModel;
  const FoodItemWidget({
    Key? key,
    required this.foodItemModel,
  }) : super(key: key);

  @override
  _FoodItemWidgetState createState() => _FoodItemWidgetState();
}

class _FoodItemWidgetState extends State<FoodItemWidget> {
  late FoodItemModel _model;

  int stringCutoff = 24;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = widget.foodItemModel;
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
          mainAxisSize: MainAxisSize.max,
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
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ('${_model.name}'.length <= stringCutoff)
                            ? '${_model.name}'
                            : '${'${_model.name}'.substring(0, stringCutoff)}...',
                        textAlign: TextAlign.start,
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
                    buttonSize: 50.0,
                    icon: Icon(
                      Icons.mode_edit,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 28.0,
                    ),
                    onPressed: () async {
                      //removeFoodFromFoods();
                      addFoodToTemp();
                      context.pushNamed('editFood');
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

  void removeFoodFromFoods() async {
    final firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot = await firestore
        .collection('users')
        .doc(currentUserDocument?.uid)
        .collection('foods')
        .where("id", isEqualTo: _model.id)
        .limit(1)
        .get();

    DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
    DocumentReference documentReference = documentSnapshot.reference;

    await documentReference.delete();
  }
}
