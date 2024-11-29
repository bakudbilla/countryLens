import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/country_provider.dart';

class CountrySearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return Consumer<CountryProvider>(
      builder: (context, provider, child) {
        provider.searchCountries(query);

        return Container(
          color: Colors.blueAccent,
          child: ListView.builder(
            itemCount: provider.filteredCountries.length,
            itemBuilder: (context, index) {
              final country = provider.filteredCountries[index];
              return ListTile(
                leading: Image.network(
                  country.flag,
                  width: 50,
                  height: 30,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.flag),
                ),
                title: Text(country.name,
                style: const TextStyle(
                  color: Colors.white,
                ),),
                subtitle: Text(country.capital,
                style: const TextStyle(
                  color: Colors.white,
                )),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: country,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}