// ignore_for_file: unnecessary_null_comparison

import 'check_api.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

void main() {
  // & Declaration of API key goes here...
  // & Fill this in with your own key!
  String? OpenWeatherAPIKey = null;

  // This function is a sanity check to make sure the API is OK.
  // And make sure your key is accepted.
  CheckAPIHealth(OpenWeatherAPIKey);

  // A nice UI, at least for a CLI...
  // todo: Consider improvements, for now, it's fine.
  print("########################################");
  print("#                                      #");
  print("#           Dart-Meteorology           #");
  print("#                                      #");
  print("#    Get the latest in weather info!   #");
  print("#                                      #");
  print("########################################");
  print("\n1. Get Current Weather Data");
  print("2. Exit program");
  stdout.write(":: ");

  String? UserInput = stdin.readLineSync();

  if(UserInput == null) {
    throw ArgumentError("Menu does not accept NULL arguments!");
  }
  
}