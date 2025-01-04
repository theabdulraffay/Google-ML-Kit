import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ImageTextPickerUtil {
  TextRecognizer textRecognizer = TextRecognizer();
  Future<String> getTextFromPath(String path) async {
    final response =
        await textRecognizer.processImage(InputImage.fromFilePath(path));
    return response.text;
  }
}
