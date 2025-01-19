import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FavoriteJokesScreen extends StatelessWidget {
  const FavoriteJokesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Jokes')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('favorites').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final jokes = snapshot.data!.docs;
          return ListView.builder(
            itemCount: jokes.length,
            itemBuilder: (context, index) {
              final joke = jokes[index];
              return ListTile(
                title: Text(joke['setup']),
                subtitle: Text(joke['punchline']),
              );
            },
          );
        },
      ),
    );
  }
}
