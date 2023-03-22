import 'dart:math';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: DiceApp()));
}
class DiceApp extends StatefulWidget {
  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  int _diceNumber = 1;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: pi * 2).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  void _rollDice() {
    _animationController.reset();
    _animationController.forward(from: 0).then((_) {
      setState(() {
        _diceNumber = Random().nextInt(6) + 1;
      });
      _animationController.reverse(from: 1);
    });

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle: _animation.value,
              child: Image.asset(
                'images/dice$_diceNumber.png',
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _rollDice,
              child: Text('Roll Dice'),
            ),
          ],
        ),
      ),
    );
  }
}
