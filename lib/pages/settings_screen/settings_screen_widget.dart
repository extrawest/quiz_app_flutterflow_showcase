import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_screen_model.dart';
export 'settings_screen_model.dart';

class SettingsScreenWidget extends StatefulWidget {
  const SettingsScreenWidget({Key? key}) : super(key: key);

  @override
  _SettingsScreenWidgetState createState() => _SettingsScreenWidgetState();
}

class _SettingsScreenWidgetState extends State<SettingsScreenWidget> {
  late SettingsScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
          'Settings',
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                    child: Text(
                      'Press the button if you want to reset all data of quizzes history.',
                      style: FlutterFlowTheme.of(context).bodyText2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 20.0),
              child: FFButtonWidget(
                onPressed: FFAppState().commonResult.length < 1
                    ? null
                    : () async {
                        setState(() {
                          FFAppState().answerData = [];
                          FFAppState().userAnswer = [];
                          FFAppState().quizName = [];
                          FFAppState().questionData = [];
                          FFAppState().quizDateTime = [];
                          FFAppState().commonResult = [];
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'You have reset all history data!',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryColor,
                          ),
                        );
                      },
                text: 'Reset stored data',
                options: FFButtonOptions(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
          ),
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 0.0, 0.0),
              child: Text(
                'Theme',
                textAlign: TextAlign.start,
                style: FlutterFlowTheme.of(context).subtitle1,
              ),
            ),
          ),
          SwitchListTile.adaptive(
            value: _model.switchListTileValue ??= FFAppState().useSystemTheme,
            onChanged: (newValue) async {
              setState(() => _model.switchListTileValue = newValue!);
              if (newValue!) {
                setState(() {
                  FFAppState().useSystemTheme = true;
                });
                setDarkModeSetting(context, ThemeMode.system);
              } else {
                setState(() {
                  FFAppState().useSystemTheme = false;
                });
                setDarkModeSetting(
                  context,
                  !FFAppState().isLightTheme ? ThemeMode.dark : ThemeMode.light,
                );
              }
            },
            title: Text(
              FFAppState().useSystemTheme
                  ? 'Use System Theme'
                  : 'Use custom Theme',
              style: FlutterFlowTheme.of(context).title3,
            ),
            subtitle: Text(
              FFAppState().useSystemTheme
                  ? 'Switch off this switcher to be able to switch between the Light and the Dark Themes'
                  : 'Switch on this switcher to use the Theme from the System',
              style: FlutterFlowTheme.of(context).bodyText2,
            ),
            activeColor: FlutterFlowTheme.of(context).primaryColor,
            activeTrackColor: Color(0x8A4B39EF),
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
            contentPadding:
                EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 20.0, 20.0),
              child: FFButtonWidget(
                onPressed: FFAppState().useSystemTheme
                    ? null
                    : () async {
                        if (Theme.of(context).brightness == Brightness.light) {
                          setDarkModeSetting(context, ThemeMode.dark);
                          setState(() {
                            FFAppState().isLightTheme = false;
                          });
                        } else {
                          setDarkModeSetting(context, ThemeMode.light);
                          setState(() {
                            FFAppState().isLightTheme = true;
                          });
                        }
                      },
                text: Theme.of(context).brightness == Brightness.light
                    ? 'Set Dark mode'
                    : 'Set Light mode',
                options: FFButtonOptions(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 25.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primaryColor,
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
          ),
        ],
      ),
    );
  }
}
