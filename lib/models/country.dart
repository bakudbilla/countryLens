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
      name: json['name'] is Map ? (json['name']['common'] ?? '') : json['name'] ?? '',
      capital: json['capital'] is List && (json['capital'] as List).isNotEmpty
          ? json['capital'][0]
          : '',
      region: json['region'] ?? '',
      subregion: json['subregion'] ?? '',
      population: json['population'] ?? 0,
      flag: json['flags'] is Map ? json['flags']['png'] ?? '' : '',
      languages: json['languages'] != null && json['languages'] is Map
          ? (json['languages'] as Map<String, dynamic>).values.toList().cast<String>()
          : [],
      currencies: json['currencies'] != null && json['currencies'] is Map
          ? (json['currencies'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(key, (value as Map)['name'] ?? ''),
      )
          : {},
    );
  }

}
