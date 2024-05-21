

void main() {
  // & declaration of vars here.
  String? OpenWeatherAPIKey = null;

  // Quick check to see if API key is still null.
  // This always throws unhandled exception.
  if(OpenWeatherAPIKey == null) { throw Exception("API Key is null!\nPlease add in your API Key."); }
}