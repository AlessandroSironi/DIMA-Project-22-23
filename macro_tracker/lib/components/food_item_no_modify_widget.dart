import 'package:macro_tracker/auth/firebase_auth/auth_util.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_icon_button.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_theme.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:macro_tracker/components/food_item_no_modify_model.dart';
export 'package:macro_tracker/components/food_item_no_modify_model.dart';

class FoodItemNoModifyWidget extends StatefulWidget {
  final FoodItemNoModifyModel foodItemNoModifyModel;
  const FoodItemNoModifyWidget({Key? key, required this.foodItemNoModifyModel})
      : super(key: key);

  @override
  _FoodItemNoModifyWidgetState createState() => _FoodItemNoModifyWidgetState();
}

class _FoodItemNoModifyWidgetState extends State<FoodItemNoModifyWidget> {
  late FoodItemNoModifyModel _model;

  int stringCutoff = 24;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = widget.foodItemNoModifyModel;
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

  void addFoodToDiary() async {
    print("add food to diary");
    final firestore = FirebaseFirestore.instance;
    //documentId is equal to the timestamp of the food
    DateTime now = DateTime.now();
    int documentId = now.millisecondsSinceEpoch;

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
