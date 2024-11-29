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
      name: json['name'] ?? '',
      capital: json['capital'] ?? '',
      region: json['region'] ?? '',
      subregion: json['subregion'] ?? '',
      population: json['population'] ?? 0,
      flag: json['flags']['png'] ?? '',
      languages: json['languages'] != null && json['languages'] is List
          ? (json['languages'] as List).map((lang) => lang['name']).toList().cast<String>()
          : [],
      currencies: json['currencies'] != null && json['currencies'] is List
          ? Map.fromIterable(json['currencies'], key: (item) => item['code'], value: (item) => item['name'])
          : {},
    );
  }
}