import 'package:google_mlkit_language_id/google_mlkit_language_id.dart';

class LanguageIdentificationUtil {
  static LanguageIdentifier? identifier;
  Future<String> identifyLanguage(String text) async {
    final String response = await identifier!.identifyLanguage(text);
    return response;
  }
}
