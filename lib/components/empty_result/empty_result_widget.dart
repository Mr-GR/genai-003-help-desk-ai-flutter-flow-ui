import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_result_model.dart';
export 'empty_result_model.dart';

class EmptyResultWidget extends StatefulWidget {
  const EmptyResultWidget({super.key});

  @override
  State<EmptyResultWidget> createState() => _EmptyResultWidgetState();
}

class _EmptyResultWidgetState extends State<EmptyResultWidget> {
  late EmptyResultModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyResultModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/Frame.png',
              width: 296.0,
              height: 299.0,
              fit: BoxFit.contain,
            ),
          ),
          Text(
            'Not found',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Urbanist',
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer eget sem eu lectus malesuada vehicula vel sodales augue. ',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Urbanist',
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  lineHeight: 1.5,
                ),
          ),
        ].divide(SizedBox(height: 10.0)),
      ),
    );
  }
}
