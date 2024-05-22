// ignore_for_file: unnecessary_null_comparison

import 'package:http/http.dart' as http;

Future<String> CheckAPIHealth(String? APIKey) async {
  String API_Result = "undefined.";
  // These are quick checks to make sure the key is indeed a proper-enough key.
  // This always throws unhandled exception.
  if(APIKey == null) {
    throw Exception("API Key is null!\n");
  }

  if(APIKey.length > 32) {
    throw Exception("API Key is too long!\n");
  }

  // We test ping the API to make sure the service is online.
  String apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=London&appid=$APIKey';
  http.Response response = await http.get(Uri.parse(apiUrl));

  // This checks for a most possible outcomes.
  switch(response.statusCode) {
    // 200 - OK.
    case 200:
      API_Result = "200. API is OK.";
      break;

    // 301 - Moved Permanently
    case 301:
      API_Result = "301. API has moved permanently.";
      break;

    // 400 - Bad Request
    case 400:
      API_Result = "400. Bad request.";
      break;

    // 401 - Unauthorized
    case 401:
      throw  "401. You are not authorized.";

    // 403 - Forbidden
    case 403:
      throw "403. You are banned from accessing this API.";

    // 404 - Not Found
    case 404:
      throw "404. API not found.";

    // 408 - Timeout
    case 408:
    throw "408. You are timed out.";

    // 429 - Too Many Requests
    case 429:
      throw "429. You've made too many requests.";

    default:
      API_Result = "$response - Server-side error has occured.";
  }

  return API_Result;
}