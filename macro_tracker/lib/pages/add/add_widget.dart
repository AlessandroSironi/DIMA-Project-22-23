import 'package:flutter/cupertino.dart';
import 'package:macro_tracker/flutter_flow/flutter_flow_calendar.dart';
import '../../auth/firebase_auth/auth_util.dart';
import '../../backend/backend.dart';
import '/components/food_item_no_modify_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'add_model.dart';
export 'add_model.dart';

import 'package:openfoodfacts/openfoodfacts.dart';

class AddWidget extends StatefulWidget {
  const AddWidget({Key? key}) : super(key: key);

  @override
  _AddWidgetState createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  late AddModel _model;
  final mobileWidget = true;
  final tabletWidget = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  int documentId = -1;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddModel());
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
          'Add',
          style: FlutterFlowTheme.of(context).displaySmall.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).white,
              ),
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
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 1.0,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var result = scanBarcode();
                              if (await result) {
                                context.pushNamed('AddBarcodeFood');
                              } else {
                                context.pushNamed('Add');
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CupertinoAlertDialog(
                                        title: const Text('Error'),
                                        content: Text(
                                            'Sorry, no food has been found!'),
                                        actions: <CupertinoDialogAction>[
                                          CupertinoDialogAction(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'OK',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontWeight: FontWeight.w800,
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              }
                            },
                            text: 'Barcode Scanner',
                            icon: FaIcon(
                              FontAwesomeIcons.barcode,
                            ),
                            options: FFButtonOptions(
                              height: 130.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              hoverBorderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).white,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('AddCustomFood');
                            },
                            text: 'Add Manual Macros',
                            icon: Icon(
                              Icons.playlist_add_sharp,
                              size: 30.0,
                            ),
                            options: FFButtonOptions(
                              height: 130.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              hoverBorderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).white,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('Diet');
                            },
                            text: 'Food from Diet',
                            icon: Icon(
                              Icons.restaurant_menu,
                              size: 30.0,
                            ),
                            options: FFButtonOptions(
                              height: 130.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              hoverBorderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).white,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'From yesterday:',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: buildListView(mobileWidget)),
                  ],
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
              ))
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 0.0, 50.0, 0.0),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: FFButtonWidget(
                                onPressed: () {
                                  scanBarcode();
                                  context.pushNamed('AddBarcodeFood');
                                },
                                text: 'Barcode Scanner',
                                icon: FaIcon(
                                  FontAwesomeIcons.barcode,
                                ),
                                options: FFButtonOptions(
                                  height: 130.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                  hoverBorderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).white,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed('AddCustomFood');
                                    },
                                    text: 'Add Manual Macros',
                                    icon: Icon(
                                      Icons.playlist_add_sharp,
                                      size: 30.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 300.0,
                                      height: 130.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Colors.white,
                                            fontSize: 20.0,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                      hoverBorderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed('Diet');
                                    },
                                    text: 'Food from Diet',
                                    icon: Icon(
                                      Icons.restaurant_menu,
                                      size: 30.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 300.0,
                                      height: 130.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Colors.white,
                                            fontSize: 20.0,
                                          ),
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                      hoverBorderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).white,
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 50.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'From yesterday:',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 10.0, 50.0, 10.0),
                        child: buildListView(tabletWidget),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListView(bool isMobile) {
    DateTime yesterday = DateTime.now().subtract(Duration(days: 1));

    Query<Map<String, dynamic>> foodsQuery = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserDocument?.uid)
        .collection('foods')
        .where('datetime', isGreaterThanOrEqualTo: yesterday.startOfDay)
        .where('datetime', isLessThan: yesterday.endOfDay);

    return Container(
        child: SingleChildScrollView(
            child: Column(children: [
      StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: foodsQuery.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          if (documents.isEmpty) {
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(50.0, 10.0, 50.0, 10.0),
                child: Text('No foods inserted yesterday'));
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              final foodData = documents[index].data() as Map<String, dynamic>;

              final foodItem = FoodItemNoModifyModel(
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
                  child:
                      FoodItemNoModifyWidget(foodItemNoModifyModel: foodItem));
            },
          );
        },
      )
    ])));
  }

  Future<bool> scanBarcode() async {
    final firestore = FirebaseFirestore.instance;
    String scannedBarcode = await FlutterBarcodeScanner.scanBarcode(
      '#DD2556', // scanning line color
      'Cancel', // cancel button text
      true, // whether to show the flash icon
      ScanMode.BARCODE,
    );

    print("scanned barcode: $scannedBarcode");
    //OpenFoodFacts
    ProductQueryConfiguration config = ProductQueryConfiguration(scannedBarcode,
        version: ProductQueryVersion.v3);
    ProductResultV3 product = await OpenFoodAPIClient.getProductV3(config);

    String? name = product.product?.productName;
    if (name != null) {
      int? kcal = product.product?.nutriments
          ?.getValue(Nutrient.energyKCal, PerSize.oneHundredGrams)
          ?.toInt();
      int? carbs = product.product?.nutriments
          ?.getValue(Nutrient.carbohydrates, PerSize.oneHundredGrams)
          ?.toInt();
      int? proteins = product.product?.nutriments
          ?.getValue(Nutrient.proteins, PerSize.oneHundredGrams)
          ?.toInt();
      int? fats = product.product?.nutriments
          ?.getValue(Nutrient.fat, PerSize.oneHundredGrams)
          ?.toInt();

      DateTime now = DateTime.now();
      documentId = now.millisecondsSinceEpoch;

      await firestore
          .collection('users')
          .doc(currentUserDocument?.uid)
          .collection('temp')
          .doc(documentId.toString())
          .set({
        'name': name,
        'kcal': kcal,
        'carbs': carbs,
        'proteins': proteins,
        'fats': fats,
        'datetime': now,
        'id': documentId,
      });

      print(
          "Scanned: $scannedBarcode, name: $name, kcal: $kcal, carbs: $carbs, proteins: $proteins, fats: $fats");
      return true;
    }
    return false;
  }
}
