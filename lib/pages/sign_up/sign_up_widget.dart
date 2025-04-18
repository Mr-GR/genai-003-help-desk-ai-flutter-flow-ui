import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '/components/back_btn/back_btn_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'sign_up_model.dart';
import '/config.dart';
export 'sign_up_model.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  static String routeName = 'SignUp';
  static String routePath = '/signUp';

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  late SignUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpModel());

    _model.textController1 ??= TextEditingController(); // Email
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textController2 ??= TextEditingController(); // Password
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _handleSignup() async {
    final username = _model.textController1.text.trim();
    final password = _model.textController2.text.trim();

    final response = await http.post(
      Uri.parse('http://${Config.baseUrl}:8080/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("✅ Signup successful. Please log in."),
          backgroundColor: Colors.green,
        ),
      );
      context.pushReplacementNamed(SignInWidget.routeName);
    } else {
      final error = jsonDecode(response.body)['detail'] ?? "Signup failed.";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("❌ $error"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            children: [
              wrapWithModel(
                model: _model.backBtnModel,
                updateCallback: () => setState(() {}),
                child: BackBtnWidget(),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/Subtract_(3).png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Create a new account',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.0,
                        ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: _model.textController1,
                    focusNode: _model.textFieldFocusNode1,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _model.textController2,
                    focusNode: _model.textFieldFocusNode2,
                    obscureText: !_model.passwordVisibility,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _model.passwordVisibility
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _model.passwordVisibility =
                                !_model.passwordVisibility;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FFButtonWidget(
                    onPressed: _handleSignup,
                    text: 'Sign Up',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 55,
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily: 'Urbanist',
                            color: Colors.white,
                          ),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Urbanist',
                            fontSize: 14.0,
                          ),
                      children: [
                        const TextSpan(text: "Already have an account? "),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primary,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.pushNamed(SignInWidget.routeName);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
