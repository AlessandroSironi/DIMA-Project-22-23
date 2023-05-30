import '../../../../lib/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class RegisterModelMock extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for surname widget.
  TextEditingController? surnameController;
  String? Function(BuildContext, String?)? surnameControllerValidator;
  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  void dispose() {
    nameController?.dispose();
    surnameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
  }

  /// Additional helper methods are added here.
}
