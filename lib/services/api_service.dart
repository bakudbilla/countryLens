import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country.dart';


//This api service class ensures access to the api
class ApiService {
  static const String baseUrl = 'https://restcountries.com/v2';

  Future<List<Country>> getAllCountries() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/all'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Country.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load countries');
      }
    } catch (e) {
      throw Exception('Error fetching countries: $e');
    }
  }
//It ensures the search feature works
  Future<List<Country>> searchCountries(String query) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/name/$query'));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Country.fromJson(json)).toList();
      } else if (response.statusCode == 404) {
        throw Exception('No countries found');
      } else {
        throw Exception('Failed to search countries');
      }
    } catch (e) {
      throw Exception('Error searching countries: $e');
    }
  }
}