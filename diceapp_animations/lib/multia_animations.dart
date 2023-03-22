import 'dart:math';
import 'package:flutter/material.dart';



class Multiple extends StatelessWidget {
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

class _DiceScreenState extends State<DiceScreen>
    with SingleTickerProviderStateMixin {
  int _dice1Value = 1;
  int _dice2Value = 1;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );
  }

  void _rollDice() {
    setState(() {
      _dice1Value = Random().nextInt(6) + 1;
      _dice2Value = Random().nextInt(6) + 1;
    });
  }

  void _startAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Dice Roller'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => _rollDice(),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _animation.value * 6.3,
                    child: Image.asset(
                      'images/dice$_dice1Value.png',
                      height: 150,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () => _rollDice(),
              child: AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext context, Widget? child) {
                  return Transform.scale(
                    scale: _animation.value,
                    child: Image.asset(
                      'images/dice$_dice2Value.png',
                      height: 150,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () => _startAnimation(),
              child: Hero(
                tag: 'dice',
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
          ],
        ),
      ),
    );
  }
}
