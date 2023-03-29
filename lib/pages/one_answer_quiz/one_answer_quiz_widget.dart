import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'one_answer_quiz_model.dart';
export 'one_answer_quiz_model.dart';

class OneAnswerQuizWidget extends StatefulWidget {
  const OneAnswerQuizWidget({Key? key}) : super(key: key);

  @override
  _OneAnswerQuizWidgetState createState() => _OneAnswerQuizWidgetState();
}

class _OneAnswerQuizWidgetState extends State<OneAnswerQuizWidget> {
  late OneAnswerQuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OneAnswerQuizModel());

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
      future: QuizApiGroup.oneAnswerQuizCall.call(),
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
        final oneAnswerQuizOneAnswerQuizResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
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
            title: Text(
              'One Answer Quiz',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 2.0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Text(
                            (QuizApiGroup.oneAnswerQuizCall.questions(
                              oneAnswerQuizOneAnswerQuizResponse.jsonBody,
                            ) as List)
                                .map<String>((s) => s.toString())
                                .toList()[_model.indexItem],
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final answersAll = QuizApiGroup.oneAnswerQuizCall
                                      .answers(
                                        oneAnswerQuizOneAnswerQuizResponse
                                            .jsonBody,
                                      )
                                      ?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: answersAll.length,
                                itemBuilder: (context, answersAllIndex) {
                                  final answersAllItem =
                                      answersAll[answersAllIndex];
                                  return Visibility(
                                    visible:
                                        answersAllIndex == _model.indexItem,
                                    child: Builder(
                                      builder: (context) {
                                        final answersButton =
                                            answersAllItem.toList();
                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: answersButton.length,
                                          itemBuilder:
                                              (context, answersButtonIndex) {
                                            final answersButtonItem =
                                                answersButton[
                                                    answersButtonIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 20.0, 20.0, 20.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  _model.addToUserAnswers(
                                                      answersButtonItem
                                                          .toString());
                                                  if (functions.isLastItem(
                                                      (getJsonField(
                                                        oneAnswerQuizOneAnswerQuizResponse
                                                            .jsonBody,
                                                        r'''$..id''',
                                                      ) as List)
                                                          .map<String>((s) =>
                                                              s.toString())
                                                          .toList()!,
                                                      _model.indexItem)) {
                                                    if (Navigator.of(context)
                                                        .canPop()) {
                                                      context.pop();
                                                    }
                                                    context.pushNamed(
                                                      'ResultScreen',
                                                      queryParams: {
                                                        'appBarText':
                                                            serializeParam(
                                                          'One Answer  Quiz',
                                                          ParamType.String,
                                                        ),
                                                        'questionsData':
                                                            serializeParam(
                                                          (QuizApiGroup
                                                                  .oneAnswerQuizCall
                                                                  .questions(
                                                            oneAnswerQuizOneAnswerQuizResponse
                                                                .jsonBody,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList(),
                                                          ParamType.String,
                                                          true,
                                                        ),
                                                        'resultList':
                                                            serializeParam(
                                                          _model.userAnswers,
                                                          ParamType.String,
                                                          true,
                                                        ),
                                                        'answerData':
                                                            serializeParam(
                                                          (QuizApiGroup
                                                                  .oneAnswerQuizCall
                                                                  .rightAnswers(
                                                            oneAnswerQuizOneAnswerQuizResponse
                                                                .jsonBody,
                                                          ) as List)
                                                              .map<String>((s) =>
                                                                  s.toString())
                                                              .toList(),
                                                          ParamType.String,
                                                          true,
                                                        ),
                                                        'dateTime':
                                                            serializeParam(
                                                          getCurrentTimestamp,
                                                          ParamType.DateTime,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  } else {
                                                    setState(() {
                                                      _model.indexItem =
                                                          _model.indexItem + 1;
                                                    });
                                                  }
                                                },
                                                text: getJsonField(
                                                  answersButtonItem,
                                                  r'''$''',
                                                ).toString(),
                                                options: FFButtonOptions(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 20.0,
                                                          20.0, 20.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
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
