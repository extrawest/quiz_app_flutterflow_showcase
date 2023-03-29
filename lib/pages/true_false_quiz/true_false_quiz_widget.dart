import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'true_false_quiz_model.dart';
export 'true_false_quiz_model.dart';

class TrueFalseQuizWidget extends StatefulWidget {
  const TrueFalseQuizWidget({Key? key}) : super(key: key);

  @override
  _TrueFalseQuizWidgetState createState() => _TrueFalseQuizWidgetState();
}

class _TrueFalseQuizWidgetState extends State<TrueFalseQuizWidget> {
  late TrueFalseQuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrueFalseQuizModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: QuizApiGroup.trueFalseQuizCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final trueFalseQuizTrueFalseQuizResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.pop();
                  },
                ),
              ),
              title: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 30.0, 0.0, 0.0),
                child: Text(
                  'True or False Quiz',
                  style: FlutterFlowTheme.of(context).title2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                ),
              ),
              actions: [],
              centerTitle: false,
              toolbarHeight: 80.0,
              elevation: 2.0,
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FutureBuilder<ApiCallResponse>(
                      future: QuizApiGroup.trueFalseQuizCall.call(),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final columnTrueFalseQuizResponse = snapshot.data!;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: Text(
                                (QuizApiGroup.trueFalseQuizCall.questions(
                                  trueFalseQuizTrueFalseQuizResponse.jsonBody,
                                ) as List)
                                    .map<String>((s) => s.toString())
                                    .toList()[_model.index],
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context).subtitle2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  _model.addToUserAnswers(
                                      functions.boolToString(true));
                                  if (functions.isLastItem(
                                      (getJsonField(
                                        columnTrueFalseQuizResponse.jsonBody,
                                        r'''$..id''',
                                      ) as List)
                                          .map<String>((s) => s.toString())
                                          .toList()!,
                                      _model.index)) {
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed(
                                      'ResultScreen',
                                      queryParams: {
                                        'appBarText': serializeParam(
                                          'True False Quiz',
                                          ParamType.String,
                                        ),
                                        'resultList': serializeParam(
                                          _model.userAnswers,
                                          ParamType.String,
                                          true,
                                        ),
                                        'questionsData': serializeParam(
                                          (QuizApiGroup.trueFalseQuizCall
                                                  .questions(
                                            columnTrueFalseQuizResponse
                                                .jsonBody,
                                          ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList(),
                                          ParamType.String,
                                          true,
                                        ),
                                        'answerData': serializeParam(
                                          (QuizApiGroup.trueFalseQuizCall
                                                  .answers(
                                            columnTrueFalseQuizResponse
                                                .jsonBody,
                                          ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList(),
                                          ParamType.String,
                                          true,
                                        ),
                                        'dateTime': serializeParam(
                                          getCurrentTimestamp,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                        ),
                                      },
                                    );
                                  } else {
                                    setState(() {
                                      _model.index = _model.index + 1;
                                    });
                                  }
                                },
                                text: 'True',
                                options: FFButtonOptions(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 20.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    _model.addToUserAnswers('false');
                                  });
                                  if (functions.isLastItem(
                                      (getJsonField(
                                        columnTrueFalseQuizResponse.jsonBody,
                                        r'''$..id''',
                                      ) as List)
                                          .map<String>((s) => s.toString())
                                          .toList()!,
                                      _model.index)) {
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed(
                                      'ResultScreen',
                                      queryParams: {
                                        'appBarText': serializeParam(
                                          'True False Quiz',
                                          ParamType.String,
                                        ),
                                        'resultList': serializeParam(
                                          _model.userAnswers,
                                          ParamType.String,
                                          true,
                                        ),
                                        'questionsData': serializeParam(
                                          (QuizApiGroup.trueFalseQuizCall
                                                  .questions(
                                            columnTrueFalseQuizResponse
                                                .jsonBody,
                                          ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList(),
                                          ParamType.String,
                                          true,
                                        ),
                                        'answerData': serializeParam(
                                          (QuizApiGroup.trueFalseQuizCall
                                                  .answers(
                                            columnTrueFalseQuizResponse
                                                .jsonBody,
                                          ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList(),
                                          ParamType.String,
                                          true,
                                        ),
                                        'dateTime': serializeParam(
                                          getCurrentTimestamp,
                                          ParamType.DateTime,
                                        ),
                                      }.withoutNulls,
                                    );
                                  } else {
                                    setState(() {
                                      _model.index = _model.index + 1;
                                    });
                                  }
                                },
                                text: 'False',
                                options: FFButtonOptions(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 20.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
