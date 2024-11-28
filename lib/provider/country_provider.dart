import 'package:flutter/material.dart';
import '../models/country.dart';
import '../services/api_service.dart';

class CountryProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Country> _countries = [];
  List<Country> _filteredCountries = [];
  bool _isLoading = false;
  String _error = '';

  List<Country> get countries => _countries;
  List<Country> get filteredCountries => _filteredCountries;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchAllCountries() async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _countries = await _apiService.getAllCountries();
      _filteredCountries = _countries;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> searchCountries(String query) async {
    if (query.isEmpty) {
      _filteredCountries = _countries;
      notifyListeners();
      return;
    }

    _filteredCountries = _countries
        .where((country) =>
            country.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}