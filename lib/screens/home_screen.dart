import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/joke_card.dart';
import 'favorite_jokes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoriteJokesScreen()),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: fetchJokes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("No jokes available"));
          }
          final jokes = snapshot.data as List<Map<String, String>>;
          return ListView.builder(
            itemCount: jokes.length,
            itemBuilder: (context, index) {
              return JokeCard(
                setup: jokes[index]['setup']!,
                punchline: jokes[index]['punchline']!,
                onTap: () {
                  // Handle tap event
                },
                onFavoriteTap: () {
                  addToFavorites(jokes[index]);
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<List<Map<String, String>>> fetchJokes() async {
    // Replace with API call to fetch jokes
    return [
      {'setup': 'Why do programmers prefer dark mode?', 'punchline': 'Because light attracts bugs!'},
      {'setup': 'Why do Java developers wear glasses?', 'punchline': 'Because they can\'t C#.'},
    ];
  }

  void addToFavorites(Map<String, String> joke) {
    FirebaseFirestore.instance.collection('favorites').add(joke);
  }
}
