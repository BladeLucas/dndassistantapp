import 'package:dndassistantapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

String dropdownvalue = "6";
int numberOfDice = 1;
bool diceRolled = false;
List<int> rolls = <int>[];

class DiceBag extends StatefulWidget {
  const DiceBag({super.key});

  @override
  State<DiceBag> createState() => _DiceBagState();
}

List<int> roll() {
  int diceSelected = int.parse(dropdownvalue);
  var rng = Random();
  List<int> diceRolls = <int>[];
  for (int i = 0; i < numberOfDice; i++) {
    diceRolls.add(rng.nextInt(diceSelected) + 1);
  }
  diceRolled = true;
  return diceRolls;
}

String stringBuilder() {
  String message = "You Rolled a ";
  for (int i = 0; i < rolls.length; i++) {
    if (rolls.length == 1) {
      message += rolls[i].toString();
    } else {
      if (i != rolls.length - 1) {
        message += "${rolls[i]}, ";
      } else {
        message += rolls[i].toString();
      }
    }
  }
  return message;
}

class _DiceBagState extends State<DiceBag> {
  TextEditingController numberOfDiceController = TextEditingController();

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
                    DropdownMenuItem(value: "4", child: Text("D4")),
                    DropdownMenuItem(value: "6", child: Text("D6")),
                    DropdownMenuItem(value: "8", child: Text("D8")),
                    DropdownMenuItem(value: "10", child: Text("D10")),
                    DropdownMenuItem(value: "12", child: Text("D12")),
                    DropdownMenuItem(value: "20", child: Text("D20")),
                  ],
                  value: dropdownvalue,
                  onChanged: (String? value) {
                    setState(() {
                      dropdownvalue = value!;
                    });
                  }),
              TextFormField(
                  controller: numberOfDiceController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: "Number of Dice"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    numberOfDice = int.tryParse(value) ?? 1;
                  }),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    rolls.clear();
                    rolls = roll();
                  });
                },
                child: const Text("Roll"),
              ),
              Visibility(
                  visible: diceRolled,
                  child: Text(
                    stringBuilder(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  )),
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
