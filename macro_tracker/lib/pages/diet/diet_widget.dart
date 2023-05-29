import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:macro_tracker/auth/firebase_auth/auth_util.dart';
import 'package:macro_tracker/components/diet_food_item_widget.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_choice_chips.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_theme.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_util.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_widgets.dart';
import 'package:macro_tracker/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:macro_tracker/pages/diet/diet_model.dart';
export 'package:macro_tracker/pages/diet/diet_model.dart';

class DietWidget extends StatefulWidget {
  const DietWidget({Key? key}) : super(key: key);

  @override
  _DietWidgetState createState() => _DietWidgetState();
}

class _DietWidgetState extends State<DietWidget> {
  late DietModel _model;
  final mobileWidget = true;
  final tabletWidget = false;
  //bool showClearChoice = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DietModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        title: Text(
          'Diet',
          style: FlutterFlowTheme.of(context).displaySmall.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).white,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                context.pushNamed('AddCustomFood');
              },
              text: 'Add Custom Food',
              icon: Icon(
                Icons.add,
                size: 15.0,
              ),
              options: FFButtonOptions(
                width: 130.0,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 25.0, 10.0, 0.0),
                          child: FlutterFlowChoiceChips(
                            options: [
                              ChipData('🥐 Breakfast'),
                              ChipData('🍜 Lunch'),
                              ChipData('🥘 Dinner'),
                              ChipData('🍎 Snack')
                            ],
                            onChanged: (val) {
                              //showClearChoice = true;
                              setState(() =>
                                  _model.mealChoiceFilterValue1 = val?.first);
                            },
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 18.0,
                              elevation: 4.0,
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent4,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 18.0,
                              elevation: 4.0,
                            ),
                            chipSpacing: 10.0,
                            multiselect: false,
                            alignment: WrapAlignment.start,
                            controller:
                                _model.mealChoiceFilterValueController1 ??=
                                    FormFieldController<List<String>>(
                              [],
                            ),
                          ),
                        ),
                        /* Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                          child: Visibility(
                            visible: showClearChoice,
                            child: FFButtonWidget(
                                onPressed: () {
                                  clearSelection();
                                },
                                text: 'Clear Selection',
                                options: FFButtonOptions(
                                  height: 40,
                                  padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              )
                            ),
                        ), */
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 10.0),
                          child: buildListView(
                              _model.mealChoiceFilterValue1?.split(' ')[1]),
                        ),
                      ],
                    ),
                  ),
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(50, 20, 50, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 25, 10, 0),
                          child: FlutterFlowChoiceChips(
                            options: [
                              ChipData('🥐 Breakfast'),
                              ChipData('🍜 Lunch'),
                              ChipData('🥘 Dinner'),
                              ChipData('🍎 Snack')
                            ],
                            onChanged: (val) {
                              //showClearChoice = true;
                              setState(() =>
                                  _model.mealChoiceFilterValue2 = val?.first);
                            },
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 18,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24,
                              elevation: 4,
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).accent4,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 16,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              iconSize: 24,
                              elevation: 4,
                            ),
                            chipSpacing: 30,
                            multiselect: false,
                            alignment: WrapAlignment.start,
                            controller:
                                _model.mealChoiceFilterValueController2 ??=
                                    FormFieldController<List<String>>(
                              [],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              50.0, 10.0, 50.0, 10.0),
                          child: buildListView(
                              _model.mealChoiceFilterValue2?.split(" ")[1]),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListView(String? meal) {
    Query<Map<String, dynamic>> foodsQuery = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserDocument?.uid)
        .collection('diet_foods')
        .where("meal", isEqualTo: meal);

    return Container(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: foodsQuery.snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  final List<DocumentSnapshot> documents = snapshot.data!.docs;

                  if (documents.isEmpty) {
                    return Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          50.0, 10.0, 50.0, 10.0),
                      child: Text('No foods inserted yet in your diet'),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: documents.length,
                    itemBuilder: (BuildContext context, int index) {
                      final foodData =
                          documents[index].data() as Map<String, dynamic>;

                      final foodItem = DietFoodItemModel(
                        carbs: foodData['carbs'],
                        fats: foodData['fats'],
                        kcal: foodData['kcal'],
                        proteins: foodData['proteins'],
                        name: foodData['name'],
                        meal: foodData['meal'],
                        quantity: foodData['quantity'],
                        datetime: (foodData['datetime'] as Timestamp).toDate(),
                        id: foodData['id'],
                      );

                      return Container(
                        height: 80,
                        child: DietFoodItemWidget(dietFoodItemModel: foodItem),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
