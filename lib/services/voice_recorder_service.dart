import 'dart:io';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceRecorderService {
  FlutterSoundRecorder? _recorder;
  String? _recordingPath;

  Future<void> startRecording() async {
    _recorder = FlutterSoundRecorder();

    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw Exception("Microphone permission not granted");
    }

    await _recorder!.openRecorder();

    final dir = await getTemporaryDirectory();
    _recordingPath = '${dir.path}/voice_note.wav';

    await _recorder!.startRecorder(
      toFile: _recordingPath,
      codec: Codec.pcm16WAV,
    );
  }


  Future<File?> stopRecording() async {
    if (_recorder == null || !_recorder!.isRecording) return null;

    await _recorder!.stopRecorder();
    await _recorder!.closeRecorder();
    return File(_recordingPath!);
  }
}
