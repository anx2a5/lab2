import 'package:flutter/material.dart';

class JokeCard extends StatelessWidget {
  final String type;
  final Function onTap;

  JokeCard({required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(type),
        onTap: () => onTap(),
      ),
    );
  }
}
