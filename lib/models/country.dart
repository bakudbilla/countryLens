class Country {
  final String name;
  final String capital;
  final String region;
  final String subregion;
  final int population;
  final String flag;
  final List<String> languages;
  final Map<String, String> currencies;

  Country({
    required this.name,
    required this.capital,
    required this.region,
    required this.subregion,
    required this.population,
    required this.flag,
    required this.languages,
    required this.currencies,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'] ?? '',
      capital: (json['capital'] as List?)?.first ?? '',
      region: json['region'] ?? '',
      subregion: json['subregion'] ?? '',
      population: json['population'] ?? 0,
      flag: json['flags']['png'] ?? '',
      languages: json['languages'] == null 
          ? [] 
          : (json['languages'] as Map<String, dynamic>).values.toList().cast<String>(),
      currencies: json['currencies'] == null 
          ? {} 
          : Map.from(json['currencies']).map(
              (key, value) => MapEntry(key, (value as Map)['name'] as String)
            ),
    );
  }
}