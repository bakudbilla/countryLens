import 'package:countrylens/screens/country_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/country_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<CountryProvider>().fetchAllCountries(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'CountryLens',
        style: TextStyle(
          fontSize: 40,
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,

        ),),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CountrySearchDelegate(),
              );
            },
          ),
        ],
      ),
     backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          // Top section with a background image and title overlay
          Stack(
            children: [
              // Background image
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/background.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Overlay with title
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
                alignment: Alignment.center,
                child: const Text(
                  'Click to view details of each country',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          // List of countries for homescreen
          Expanded(
            child: Consumer<CountryProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.error.isNotEmpty) {
                  return Center(child: Text(provider.error));
                }

                return ListView.builder(
                  itemCount: provider.countries.length,
                  itemBuilder: (context, index) {
                    final country = provider.countries[index];
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
                        fontSize: 20,
                      )),
                      subtitle: Text(country.capital,
                      style: const TextStyle(
                        color: Colors.white,
                      ),),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/details',
                          arguments: country,
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
