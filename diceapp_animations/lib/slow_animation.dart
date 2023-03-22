import 'dart:math';
import 'package:flutter/material.dart';

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
      backgroundColor: Colors.brown,
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
                  'images/dice$_dice1Value.png',
                  height: 150,
                ),
                flightShuttleBuilder: (
                    BuildContext flightContext,
                    Animation<double> animation,
                    HeroFlightDirection flightDirection,
                    BuildContext fromHeroContext,
                    BuildContext toHeroContext,
                    ) {
                  return RotationTransition(
                    turns: animation,
                    child: toHeroContext.widget,
                  );
                },
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
                  'images/dice$_dice2Value.png',
                  height: 150,
                ),
                flightShuttleBuilder: (
                    BuildContext flightContext,
                    Animation<double> animation,
                    HeroFlightDirection flightDirection,
                    BuildContext fromHeroContext,
                    BuildContext toHeroContext,
                    ) {
                  return RotationTransition(
                    turns: animation,
                    child: toHeroContext.widget,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
