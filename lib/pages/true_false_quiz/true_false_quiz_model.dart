import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrueFalseQuizModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int index = 0;

  List<String> userAnswers = [];
  void addToUserAnswers(String item) => userAnswers.add(item);
  void removeFromUserAnswers(String item) => userAnswers.remove(item);
  void removeAtIndexFromUserAnswers(int index) => userAnswers.removeAt(index);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
