import 'package:flutter/material.dart';
import 'package:lab2/screens/random_joke_screen.dart';
import '../services/api_services.dart';
import '../widgets/joke_card.dart';
import 'joke_type_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<String>> jokeTypes;

  @override
  void initState() {
    super.initState();
    jokeTypes = ApiService.fetchJokeTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joke App'),
        actions: [
          IconButton(
            icon: Icon(Icons.shuffle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RandomJokeScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: FutureBuilder<List<String>>(
        future: jokeTypes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final types = snapshot.data!;
          return ListView(
            children: types.map((type) {
              return JokeCard(
                type: type,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JokeTypeScreen(type: type),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
