import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_conversation2_model.dart';
export 'empty_conversation2_model.dart';

class EmptyConversation2Widget extends StatefulWidget {
  const EmptyConversation2Widget({
    super.key,
    required this.assistant,
  });

  final String? assistant;

  @override
  State<EmptyConversation2Widget> createState() =>
      _EmptyConversation2WidgetState();
}

class _EmptyConversation2WidgetState extends State<EmptyConversation2Widget> {
  late EmptyConversation2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyConversation2Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/Subtract_(4).png',
              width: 105.0,
              height: 104.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          'Need to add more context to your ticket?',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Urbanist',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 22.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        RichText(
          textScaler: MediaQuery.of(context).textScaler,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Remember your ',
                style: TextStyle(),
              ),
              TextSpan(
                text: valueOrDefault<String>(
                  widget.assistant,
                  'Academic Writer',
                ),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Urbanist',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                ),
          ),
          textAlign: TextAlign.center,
        ),
      ].divide(SizedBox(height: 40.0)),
    );
  }
}
