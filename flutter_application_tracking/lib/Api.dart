import 'package:flutter_application_tracking/constant.dart';
import 'package:flutter_application_tracking/coviddata/covid_data.dart';
import 'package:http/http.dart' as http;

class GetApi {
  // ignore: non_constant_identifier_names
  static Future<CovidData> GetData() async {
    Map<String, String> requestHeaders = {
      'X-RapidAPI-Key': mykey,
      'X-RapidAPI-Host': host
    };
    final response = await http.get(
        Uri.parse('https://covid-19-tracking.p.rapidapi.com/v1/usa'),
        headers: requestHeaders);
    return CovidData.fromJson(response.body);
  }

  // ignore: non_constant_identifier_names
  static Future<CovidData> GetDataFromCountry({required name}) async {
    Map<String, String> requestHeaders = {
      'X-RapidAPI-Key': mykey,
      'X-RapidAPI-Host': host
    };
    final response = await http.get(
        Uri.parse('https://covid-19-tracking.p.rapidapi.com/v1/$name'),
        headers: requestHeaders);
    return CovidData.fromJson(response.body);
  }
}
