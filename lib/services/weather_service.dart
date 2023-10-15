
import 'dart:convert';
import 'package:weather_app/services/http_service.dart';

class WeatherService{

  Future<Map<dynamic,dynamic>?> weatherInfo( String url, [String unencodePath = '', Map<String, dynamic>? queryParams] ) async{
    if (queryParams != null && queryParams.containsKey("daily")) {
      String daily = queryParams["daily"] as String;
      queryParams["daily"] = daily;
    }

    if (queryParams != null && queryParams.containsKey("current")) {
      String current = queryParams["current"] as String;
      queryParams["current"] = current;
    }

    if (queryParams != null && queryParams.containsKey("hourly")) {
      String hourly = queryParams["hourly"] as String;
      queryParams["hourly"] = hourly;
    }

    var response = await responseBody(url,unencodePath,queryParams);
    var decodedResponse = jsonDecode(response!.body) as Map;

    return decodedResponse;

  }
  
}


