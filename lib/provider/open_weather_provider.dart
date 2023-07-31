import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_response.dart';

class OpenWeatherProvider {
  static const String _apiKey = 'cc82f16ddd145bb55547d3f2cb6f37a0';
  static const String _baseUrl = 'https://api.openweathermap.org';

  final http.Client _httpClient;

  OpenWeatherProvider({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<WeatherResponse> getWeather({
    required String city,
    required String lang,
  }) async {

    final url = '$_baseUrl/data/2.5/forecast?lang=$lang&q=$city&appid=$_apiKey';
    print(url);

    final response = await _httpClient.get(Uri.parse(url));


    final result = WeatherResponse.fromJson(json.decode(response.body));


    if (result.cod == '200') {
      return result;
    } else {
      throw Exception('Error: code different to 200');
    }
  }
}
