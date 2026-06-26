import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  // The key is passed in from outside the code (Step 7), never hardcoded
  static const _apiKey = String.fromEnvironment('API_KEY');

  late final GenerativeModel _model;
  late final ChatSession _chat;

  GeminiService() {
    _model = GenerativeModel(
      model: 'gemini-2.5-flash', // confirm the current flash model in AI Studio
      apiKey: _apiKey,
    );
    _chat = _model.startChat(); // startChat remembers the conversation context
  }

  Future<String> sendMessage(String text) async {
    try {
      final response = await _chat.sendMessage(Content.text(text));
      return response.text ?? 'No response';
    } catch (e) {
      return 'Error: $e';
    }
  }
}
