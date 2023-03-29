import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start quizApi Group Code

class QuizApiGroup {
  static String baseUrl = 'https://run.mocky.io/v3';
  static Map<String, String> headers = {};
  static TrueFalseQuizCall trueFalseQuizCall = TrueFalseQuizCall();
  static OneAnswerQuizCall oneAnswerQuizCall = OneAnswerQuizCall();
}

class TrueFalseQuizCall {
  Future<ApiCallResponse> call({
    List<String>? idsList,
    List<String>? questionsList,
    List<String>? answersList,
  }) {
    final ids = _serializeList(idsList);
    final questions = _serializeList(questionsList);
    final answers = _serializeList(answersList);

    return ApiManager.instance.makeApiCall(
      callName: 'trueFalseQuiz',
      apiUrl: '${QuizApiGroup.baseUrl}/5d4b54e3-7172-43d0-b924-fe5d51707e8f',
      callType: ApiCallType.GET,
      headers: {
        ...QuizApiGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic ids1(dynamic response) => getJsonField(
        response,
        r'''$..id''',
        true,
      );
  dynamic questions(dynamic response) => getJsonField(
        response,
        r'''$[:].question''',
        true,
      );
  dynamic answers(dynamic response) => getJsonField(
        response,
        r'''$[:].rightAnswer''',
        true,
      );
  dynamic ids(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
}

class OneAnswerQuizCall {
  Future<ApiCallResponse> call({
    int? index,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'oneAnswerQuiz',
      apiUrl: '${QuizApiGroup.baseUrl}/0aeb7418-0c94-41ce-8f5b-09889cf37a58',
      callType: ApiCallType.GET,
      headers: {
        ...QuizApiGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic ids(dynamic response) => getJsonField(
        response,
        r'''$[:].id''',
        true,
      );
  dynamic questions(dynamic response) => getJsonField(
        response,
        r'''$[:].question''',
        true,
      );
  dynamic answers(dynamic response) => getJsonField(
        response,
        r'''$[:].answers''',
        true,
      );
  dynamic rightAnswers(dynamic response) => getJsonField(
        response,
        r'''$[:].rightAnswer''',
        true,
      );
}

/// End quizApi Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
