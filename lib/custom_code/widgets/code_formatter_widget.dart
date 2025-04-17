// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter/services.dart';
import 'package:highlight/highlight_core.dart'; // Import highlight core
import 'package:highlight/languages/python.dart'; // Add required languages
import 'package:highlight/languages/javascript.dart';
import 'package:highlight/languages/php.dart';
import 'package:highlight/languages/dart.dart';

class CodeFormatterWidget extends StatefulWidget {
  const CodeFormatterWidget({
    super.key,
    this.width,
    this.height,
    required this.codes,
    required this.bg,
  });

  final double? width;
  final double? height;
  final String codes;
  final Color bg;

  @override
  State<CodeFormatterWidget> createState() => _CodeFormatterWidgetState();
}

class _CodeFormatterWidgetState extends State<CodeFormatterWidget> {
  String? detectedLanguage; // To store the detected language

  @override
  void initState() {
    super.initState();

    // Register languages for detection
    highlight.registerLanguage('python', python);
    highlight.registerLanguage('javascript', javascript);
    highlight.registerLanguage('php', php);
    highlight.registerLanguage('dart', dart);

    detectLanguage(); // Detect language when the widget is initialized
  }

  void detectLanguage() {
    // Use highlight's parse function to detect the language
    final result = highlight.parse(widget.codes, autoDetection: true);
    setState(() {
      detectedLanguage =
          result.language ?? 'Unknown'; // Update the language name
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? null,
      decoration: BoxDecoration(
        color: widget.bg,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Transparent top bar with detected language name
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            decoration: BoxDecoration(
              color:
                  Colors.black.withOpacity(0.5), // Transparent black background
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  detectedLanguage ??
                      'Detecting...', // Display detected language
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.copy, size: 18, color: Colors.white),
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: widget.codes));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Code copied to clipboard!')),
                    );
                  },
                  tooltip: "Copy to Clipboard",
                ),
              ],
            ),
          ),
          // Code display area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: HighlightView(
                widget.codes,
                language: detectedLanguage, // Use the detected language
                theme: monokaiSublimeTheme, // Syntax highlighting theme
                textStyle: const TextStyle(
                  fontFamily: 'SourceCodePro',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
