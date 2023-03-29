import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResultScreenModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> resultListString = [];
  void addToResultListString(String item) => resultListString.add(item);
  void removeFromResultListString(String item) => resultListString.remove(item);
  void removeAtIndexFromResultListString(int index) =>
      resultListString.removeAt(index);

  List<String> test = [];
  void addToTest(String item) => test.add(item);
  void removeFromTest(String item) => test.remove(item);
  void removeAtIndexFromTest(int index) => test.removeAt(index);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
