import 'package:dndassistantapp/characterdetails.dart';
import 'package:dndassistantapp/main.dart';
import 'package:flutter/material.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({super.key});

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.android),
              title: Text("Insert Title"),
              subtitle: Text("Insert Subtitle"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CharacterDetailSheet()));
                    },
                    child: const Text("VIEW")),
                const SizedBox(width: 8),
                TextButton(onPressed: () {}, child: const Text("EDIT")),
                const SizedBox(width: 8),
                TextButton(onPressed: () {}, child: const Text("DELETE")),
                const SizedBox(width: 8),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CharacterCard(),
          CharacterCard(),
          CharacterCard(),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Menu()));
              },
              child: const Text("Home"))
        ],
      ),
    );
  }
}
