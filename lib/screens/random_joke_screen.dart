import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../models/joke.dart';

class RandomJokeScreen extends StatelessWidget {
  const RandomJokeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Joke')),
      body: FutureBuilder<Joke>(
        future: ApiService.fetchRandomJoke(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final joke = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.setup,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  joke.punchline,
                  style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
