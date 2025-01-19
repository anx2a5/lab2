import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String setup;
  final String punchline;
  final Function onTap;
  final Function onFavoriteTap;

  const JokeCard({
    Key? key,
    required this.setup,
    required this.punchline,
    required this.onTap,
    required this.onFavoriteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(setup),
        subtitle: Text(punchline),
        trailing: IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () => onFavoriteTap(), // Add to favorites
        ),
        onTap: () => onTap(),
      ),
    );
  }
}
