import 'package:macro_tracker/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class ChangePasswordModelMock extends FlutterFlowModel {
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
