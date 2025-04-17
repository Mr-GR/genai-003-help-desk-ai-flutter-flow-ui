import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '/config.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import '/components/back_btn/back_btn_widget.dart';
import 'sign_in_model.dart';
export 'sign_in_model.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  static String routeName = 'SignIn';
  static String routePath = '/signIn';

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  late SignInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignInModel());

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final username = _model.textController1.text.trim();
    final password = _model.textController2.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _showSnackBar("Username and password cannot be empty.");
      return;
    }

    final uri = Uri.parse('http://${Config.baseUrl}:8080/token');
    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        final token = jsonDecode(response.body)['access_token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', token);

        // Navigate to home
        context.pushReplacementNamed(HomeWidget.routeName);
      } else {
        final detail = jsonDecode(response.body)['detail'] ?? 'Login failed';
        _showSnackBar("❌ $detail");
      }
    } catch (e) {
      _showSnackBar("⚠️ Error: $e");
    }
  }

  void _showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            wrapWithModel(
              model: _model.backBtnModel,
              updateCallback: () => setState(() {}),
              child: BackBtnWidget(),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/Subtract_(3).png', width: 118, height: 109),
                const SizedBox(height: 20),
                Text(
                  'Log into your account',
                  style: FlutterFlowTheme.of(context).headlineMedium,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _model.textController1,
                  focusNode: _model.textFieldFocusNode1,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _model.textController2,
                  focusNode: _model.textFieldFocusNode2,
                  obscureText: !_model.passwordVisibility,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(_model.passwordVisibility
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        setState(() => _model.passwordVisibility = !_model.passwordVisibility);
                      },
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                ),
                const SizedBox(height: 20),
                FFButtonWidget(
                  onPressed: _login,
                  text: 'Sign In',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Urbanist',
                          color: Colors.white,
                        ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => context.pushNamed(SignUpWidget.routeName),
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
