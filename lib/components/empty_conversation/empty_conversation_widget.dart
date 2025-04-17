import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_conversation_model.dart';
export 'empty_conversation_model.dart';

class EmptyConversationWidget extends StatefulWidget {
  const EmptyConversationWidget({super.key});

  @override
  State<EmptyConversationWidget> createState() =>
      _EmptyConversationWidgetState();
}

class _EmptyConversationWidgetState extends State<EmptyConversationWidget> {
  late EmptyConversationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyConversationModel());
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
          'Capabilities',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Urbanist',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 22.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        Wrap(
          spacing: 0.0,
          runSpacing: 20.0,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.start,
          verticalDirection: VerticalDirection.down,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Answer all your questions',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Urbanist',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      '(Just anything you like)',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Urbanist',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Generate all kind of contents',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Urbanist',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      '(images, essays, stories, reports & more)',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Urbanist',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Natural Conversation',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Urbanist',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    Text(
                      '(I can talk to you like a human)',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Urbanist',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ].divide(SizedBox(height: 10.0)),
                ),
              ),
            ),
          ],
        ),
        Text(
          'These are just few examples ofwhat I can do, mention anything.',
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Urbanist',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 16.0,
                letterSpacing: 0.0,
              ),
        ),
      ].divide(SizedBox(height: 40.0)),
    );
  }
}
