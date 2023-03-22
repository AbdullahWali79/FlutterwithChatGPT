import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice Roller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int _dice1Value = 1;
  int _dice2Value = 1;

  void _rollDice() {
    setState(() {
      _dice1Value = Random().nextInt(6) + 1;
      _dice2Value = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _rollDice,
              child: Hero(
                tag: 'dice1',
                child: Image.asset(
                  'assets/images/dice$_dice1Value.png',
                  height: 150,
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            GestureDetector(
              onTap: _rollDice,
              child: Hero(
                tag: 'dice2',
                child: Image.asset(
                  'assets/images/dice$_dice2Value.png',
                  height: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
