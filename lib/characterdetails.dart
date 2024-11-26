import 'package:dndassistantapp/characters.dart';
import 'package:flutter/material.dart';

class CharacterDetailSheet extends StatefulWidget {
  const CharacterDetailSheet({super.key});

  @override
  State<CharacterDetailSheet> createState() => _CharacterDetailSheetState();
}

class _CharacterDetailSheetState extends State<CharacterDetailSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CharacterList()));
            },
            child: const Text("Back")),
      ),
    );
  }
}
