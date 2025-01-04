import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ImageTextPickerUtil {
  static final TextRecognizer _textRecognizer = TextRecognizer();
  static Future<String> getTextFromPath(String path) async {
    final response =
        await _textRecognizer.processImage(InputImage.fromFilePath(path));
    return response.text;
  }
}
