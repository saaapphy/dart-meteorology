// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  // & declaration of vars here.
  String? OpenWeatherAPIKey = null;

  // These are quick checks to make sure the key is indeed a proper-enough key.
  // This always throws unhandled exception.
  if(OpenWeatherAPIKey == null) {
    throw Exception("API Key is null!\n");
  }

  if(OpenWeatherAPIKey.length > 32) {
    throw Exception("API Key is too long!\n");
  }

  // We test ping the API to make sure the service is online.
  // todo: In a later build, we can get rid of the print statements or re-implement them.
  String apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=London&appid=$OpenWeatherAPIKey';
  http.Response response = await http.get(Uri.parse(apiUrl));

  // This checks for a myriad of possible outcomes.
  switch(response.statusCode) {
    // 200 - OK.
    case 200:
      print("200. API is OK.");
      break;

    // 301 - Moved Permanently
    case 301:
      print("301. API has moved permanently.");
      break;

    // 400 - Bad Request
    case 400:
      print("400. Bad request.");
      break;

    // 401 - Unauthorized
    case 401:
      print("401. You are not authorized.");
      break;

    // 403 - Forbidden
    case 403:
      print("403. You are banned from accessing this API.");
      break;

    // 404 - Not Found
    case 404:
      print("404. API not found.");
      break;

    // 408 - Timeout
    case 408:
    print("408. You are timed out.");
    break;

    // 429 - Too Many Requests
    case 429:
      print("429. You've made too many requests.");
      break;

    case > 500:
      print("$response - Server-side error has occured.");
  }
}