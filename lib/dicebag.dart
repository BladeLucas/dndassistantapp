import 'package:dndassistantapp/main.dart';
import 'package:flutter/material.dart';

class DiceBag extends StatefulWidget {
  const DiceBag({super.key});

  @override
  State<DiceBag> createState() => _DiceBagState();
}

class _DiceBagState extends State<DiceBag> {
  String dropdownvalue = "D6";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dice Bag"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              DropdownButton(
                  items: const [
                    DropdownMenuItem(child: Text("D4"), value: "D4"),
                    DropdownMenuItem(child: Text("D6"), value: "D6"),
                    DropdownMenuItem(child: Text("D8"), value: "D8"),
                    DropdownMenuItem(child: Text("D10"), value: "D10"),
                    DropdownMenuItem(child: Text("D12"), value: "D12"),
                    DropdownMenuItem(child: Text("D20"), value: "D20"),
                  ],
                  value: dropdownvalue,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownvalue = value!;
                    });
                  }),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "Number of Dice"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Roll"),
              ),
              const Text(
                "You Rolled a [NUMBER]",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Menu()));
                },
                child: const Text("Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
