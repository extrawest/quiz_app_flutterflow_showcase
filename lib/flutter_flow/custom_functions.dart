import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

bool isLastItem(
  List<String> items,
  int index,
) {
  final length = items.length;
  final indexItem = index + 1;

  bool result;

  if (length == indexItem) {
    result = true;
  } else {
    result = false;
  }

  return result;
}

List<String> calculateRightAnswersSring(
  List<bool> answers,
  List<bool> rightTFAnswers,
) {
  List<String> result = [];
  for (var i = 0; i < answers.length; i++) {
    if (answers[i] == rightTFAnswers[i]) {
      result.add('true');
    } else {
      result.add('false');
    }
  }
  return result;
}

String concatString(
  List<String>? list,
  int? index,
) {
  bool resultB = false;
  final length = list?.length ?? 0;
  final indexItem = (index ?? 0) + 1;

  if (length == indexItem) {
    resultB = true;
  }
  final result = 'list:$list, length:$length, index:$indexItem, $resultB';
  return result;
}

bool isRightTFAnswer(
  List<bool> list,
  int index,
  bool userAnswer,
) {
  bool isRightAnswer = false;
  if (list[index] == userAnswer) {
    isRightAnswer = true;
  }
  return isRightAnswer;
}

int calculateRightAnswers(
  List<String> answers,
  List<String> rightAnswers,
) {
  int sumRightAnswers = 0;

  for (var i = 0; i < answers.length; i++) {
    if (answers[i] == rightAnswers[i]) {
      sumRightAnswers += 1;
    }
  }
  return sumRightAnswers;
}

String boolToString(bool boolValue) {
  return boolValue ? 'true' : 'false';
}

dynamic listToJson(
  List<String> listData,
  String listName,
) {
  final startString = '{"$listName":[';
  const endString = ']}';
  final List<String> quotedQuestionData = [];

  for (final data in listData) {
    quotedQuestionData.add('"$data"');
  }

  String myJSON = startString + quotedQuestionData.join(',') + endString;

  var json = jsonDecode(myJSON);
  return json;
}

String prepareCommonResults(
  String quizName,
  DateTime quizDateTime,
  List<String> questions,
  List<String> rightAnswer,
  List<String> userAnswers,
) {
  String result = '';

  result = 'n=$quizName@d=$quizDateTime';
  for (var i = 0; i < questions.length; i++) {
    result += '||q=${questions[i]}@r=${rightAnswer[i]}@u=${userAnswers[i]}';
  }
  return result;
}

List<String> newCustomFunction() {
  return ['qwerty', '1212', 'dfvfvfvd', 'wesfsfdfs'];
}

List<String> extractCommonResult(String str) {
  List<String> result = [];

  final List<String> strings = str.split('||');

  for (final string in strings) {
    result.add(string);
  }
  return result;
}

String extractQuizName(String value) {
  String result = '';
  // 'n=$quizName@d=$quizDateTime';
  final List<String> vList = value.split('@');
  for (final vItem in vList) {
    if (vItem[0] == 'n') {
      result = vItem.substring(2);
    }
  }
  return result;
}

String extractQuizDate(String value) {
  String result = '';
  // 'n=$quizName@d=$quizDateTime';
  final List<String> vList = value.split('@');
  for (final vItem in vList) {
    if (vItem[0] == 'd') {
      result = vItem.substring(2);
    }
  }
  final DateTime tempDate = new DateFormat('yyyy-MM-dd hh:mm:ss').parse(result);
  result = DateFormat('MMM d, yyyy, HH:mm:ss').format(tempDate);
  return result;
}

String extractQuizQuestion(String value) {
  String result = '';
  // ||q=$questions[i]@r=$rightAnswer[i]@u=$userAnswers[i]';
  final List<String> vList = value.split('@');
  for (final vItem in vList) {
    if (vItem[0] == 'q') {
      result = vItem.substring(2);
    }
  }
  return result;
}

String extractRightAnswer(String value) {
  String result = '';
  // ||q=$questions[i]@r=$rightAnswer[i]@u=$userAnswers[i]';
  final List<String> vList = value.split('@');
  for (final vItem in vList) {
    if (vItem[0] == 'r') {
      result = vItem.substring(2);
    }
  }
  return result;
}

String extractQuizParameter(
  String value,
  String type,
) {
  String qType = '';

  switch (type) {
    case 'question':
      qType = 'q';
      break;
    case 'rightA':
      qType = 'r';
      break;
    case 'userA':
      qType = 'u';
      break;
  }

  String result = '';
  // ||q=$questions[i]@r=$rightAnswer[i]@u=$userAnswers[i]';
  final List<String> vList = value.split('@');
  for (final vItem in vList) {
    if (vItem[0] == qType) {
      result = vItem.substring(2);
    }
  }
  return result;
}
