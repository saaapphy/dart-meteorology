// ignore_for_file: unnecessary_null_comparison

import 'check_api.dart';
import 'package:http/http.dart' as http;

void main() {
  // & Declaration of API key goes here...
  // & Fill this in with your own key!
  String? OpenWeatherAPIKey = null;

  // This function is a sanity check to make sure the API is OK.
  // And make sure your key is accepted.
  CheckAPIHealth(OpenWeatherAPIKey);

  // todo: implement a more user-friendly UI
  // ... as best as possible with CLI.
  
}