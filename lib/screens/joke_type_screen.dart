import 'package:flutter/material.dart';
import '../services/api_services.dart';
import '../models/joke.dart';

class JokeTypeScreen extends StatelessWidget {
  final String type;

  const JokeTypeScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$type Jokes')),
      body: FutureBuilder<List<Joke>>(
        future: ApiService.fetchJokesByType(type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final jokes = snapshot.data!;
          return ListView.builder(
            itemCount: jokes.length,
            itemBuilder: (context, index) {
              final joke = jokes[index];
              return ListTile(
                title: Text(joke.setup),
                subtitle: Text(joke.punchline),
              );
            },
          );
        },
      ),
    );
  }
}
