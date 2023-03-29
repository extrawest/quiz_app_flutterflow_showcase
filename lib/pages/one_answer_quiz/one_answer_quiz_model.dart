import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OneAnswerQuizModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int indexItem = 0;

  List<String> userAnswers = [];
  void addToUserAnswers(String item) => userAnswers.add(item);
  void removeFromUserAnswers(String item) => userAnswers.remove(item);
  void removeAtIndexFromUserAnswers(int index) => userAnswers.removeAt(index);

  List<String> answersData = [];
  void addToAnswersData(String item) => answersData.add(item);
  void removeFromAnswersData(String item) => answersData.remove(item);
  void removeAtIndexFromAnswersData(int index) => answersData.removeAt(index);

  List<String> questionsData = [];
  void addToQuestionsData(String item) => questionsData.add(item);
  void removeFromQuestionsData(String item) => questionsData.remove(item);
  void removeAtIndexFromQuestionsData(int index) =>
      questionsData.removeAt(index);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
