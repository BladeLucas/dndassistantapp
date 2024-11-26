import 'package:dndassistantapp/main.dart';
import 'package:flutter/material.dart';

class DiceBag extends StatefulWidget {
  const DiceBag({super.key});

  @override
  State<DiceBag> createState() => _DiceBagState();
}

class _DiceBagState extends State<DiceBag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Menu()));
            },
            child: const Text("Home")),
      ),
    );
  }
}
