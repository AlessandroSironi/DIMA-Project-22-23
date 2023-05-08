import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePasswordModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? emailTextController1;
  String? Function(BuildContext, String?)? emailTextController1Validator;
  String? _emailTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please fill in a new password..';
    }

    return null;
  }

  // State field(s) for TextField widget.
  TextEditingController? emailTextController2;
  String? Function(BuildContext, String?)? emailTextController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    emailTextController1Validator = _emailTextController1Validator;
  }

  void dispose() {
    emailTextController1?.dispose();
    emailTextController2?.dispose();
  }

  /// Additional helper methods are added here.

}
