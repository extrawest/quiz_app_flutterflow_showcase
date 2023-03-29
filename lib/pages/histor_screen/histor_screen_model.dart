import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistorScreenModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<String> answersStateList = [];
  void addToAnswersStateList(String item) => answersStateList.add(item);
  void removeFromAnswersStateList(String item) => answersStateList.remove(item);
  void removeAtIndexFromAnswersStateList(int index) =>
      answersStateList.removeAt(index);

  List<String> commonResult = [];
  void addToCommonResult(String item) => commonResult.add(item);
  void removeFromCommonResult(String item) => commonResult.remove(item);
  void removeAtIndexFromCommonResult(int index) => commonResult.removeAt(index);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
