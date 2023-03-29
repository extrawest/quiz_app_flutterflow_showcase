import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _answerData = prefs.getStringList('ff_answerData')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _answerData;
    _userAnswer = prefs.getStringList('ff_userAnswer')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _userAnswer;
    _quizName = prefs.getStringList('ff_quizName') ?? _quizName;
    _questionData = prefs.getStringList('ff_questionData')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _questionData;
    _quizDateTime = prefs
            .getStringList('ff_quizDateTime')
            ?.map((x) => DateTime.fromMillisecondsSinceEpoch(int.parse(x)))
            .toList() ??
        _quizDateTime;
    _commonResult = prefs.getStringList('ff_commonResult') ?? _commonResult;
    _useSystemTheme = prefs.getBool('ff_useSystemTheme') ?? _useSystemTheme;
    _isLightTheme = prefs.getBool('ff_isLightTheme') ?? _isLightTheme;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _answerData = [];
  List<dynamic> get answerData => _answerData;
  set answerData(List<dynamic> _value) {
    _answerData = _value;
    prefs.setStringList(
        'ff_answerData', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToAnswerData(dynamic _value) {
    _answerData.add(_value);
    prefs.setStringList(
        'ff_answerData', _answerData.map((x) => jsonEncode(x)).toList());
  }

  void removeFromAnswerData(dynamic _value) {
    _answerData.remove(_value);
    prefs.setStringList(
        'ff_answerData', _answerData.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromAnswerData(int _index) {
    _answerData.removeAt(_index);
    prefs.setStringList(
        'ff_answerData', _answerData.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _userAnswer = [];
  List<dynamic> get userAnswer => _userAnswer;
  set userAnswer(List<dynamic> _value) {
    _userAnswer = _value;
    prefs.setStringList(
        'ff_userAnswer', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToUserAnswer(dynamic _value) {
    _userAnswer.add(_value);
    prefs.setStringList(
        'ff_userAnswer', _userAnswer.map((x) => jsonEncode(x)).toList());
  }

  void removeFromUserAnswer(dynamic _value) {
    _userAnswer.remove(_value);
    prefs.setStringList(
        'ff_userAnswer', _userAnswer.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromUserAnswer(int _index) {
    _userAnswer.removeAt(_index);
    prefs.setStringList(
        'ff_userAnswer', _userAnswer.map((x) => jsonEncode(x)).toList());
  }

  List<String> _quizName = [];
  List<String> get quizName => _quizName;
  set quizName(List<String> _value) {
    _quizName = _value;
    prefs.setStringList('ff_quizName', _value);
  }

  void addToQuizName(String _value) {
    _quizName.add(_value);
    prefs.setStringList('ff_quizName', _quizName);
  }

  void removeFromQuizName(String _value) {
    _quizName.remove(_value);
    prefs.setStringList('ff_quizName', _quizName);
  }

  void removeAtIndexFromQuizName(int _index) {
    _quizName.removeAt(_index);
    prefs.setStringList('ff_quizName', _quizName);
  }

  List<dynamic> _questionData = [];
  List<dynamic> get questionData => _questionData;
  set questionData(List<dynamic> _value) {
    _questionData = _value;
    prefs.setStringList(
        'ff_questionData', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToQuestionData(dynamic _value) {
    _questionData.add(_value);
    prefs.setStringList(
        'ff_questionData', _questionData.map((x) => jsonEncode(x)).toList());
  }

  void removeFromQuestionData(dynamic _value) {
    _questionData.remove(_value);
    prefs.setStringList(
        'ff_questionData', _questionData.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromQuestionData(int _index) {
    _questionData.removeAt(_index);
    prefs.setStringList(
        'ff_questionData', _questionData.map((x) => jsonEncode(x)).toList());
  }

  List<DateTime> _quizDateTime = [];
  List<DateTime> get quizDateTime => _quizDateTime;
  set quizDateTime(List<DateTime> _value) {
    _quizDateTime = _value;
    prefs.setStringList('ff_quizDateTime',
        _value.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void addToQuizDateTime(DateTime _value) {
    _quizDateTime.add(_value);
    prefs.setStringList('ff_quizDateTime',
        _quizDateTime.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void removeFromQuizDateTime(DateTime _value) {
    _quizDateTime.remove(_value);
    prefs.setStringList('ff_quizDateTime',
        _quizDateTime.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void removeAtIndexFromQuizDateTime(int _index) {
    _quizDateTime.removeAt(_index);
    prefs.setStringList('ff_quizDateTime',
        _quizDateTime.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  List<String> _commonResult = [];
  List<String> get commonResult => _commonResult;
  set commonResult(List<String> _value) {
    _commonResult = _value;
    prefs.setStringList('ff_commonResult', _value);
  }

  void addToCommonResult(String _value) {
    _commonResult.add(_value);
    prefs.setStringList('ff_commonResult', _commonResult);
  }

  void removeFromCommonResult(String _value) {
    _commonResult.remove(_value);
    prefs.setStringList('ff_commonResult', _commonResult);
  }

  void removeAtIndexFromCommonResult(int _index) {
    _commonResult.removeAt(_index);
    prefs.setStringList('ff_commonResult', _commonResult);
  }

  bool _useSystemTheme = false;
  bool get useSystemTheme => _useSystemTheme;
  set useSystemTheme(bool _value) {
    _useSystemTheme = _value;
    prefs.setBool('ff_useSystemTheme', _value);
  }

  bool _isLightTheme = false;
  bool get isLightTheme => _isLightTheme;
  set isLightTheme(bool _value) {
    _isLightTheme = _value;
    prefs.setBool('ff_isLightTheme', _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
