import 'package:flutter/material.dart';
import 'dart:math';
Random random = Random();
int randomNumber=1;
void main() {
  runApp(Dice());
}

class Dice extends StatelessWidget {

  //const Dice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Dice App"),
        ),
        body: DiceApp(),
      ),
    );
  }
}

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  void randNUmber(){
    setState(() {
      randomNumber = random.nextInt(6)+1;
    });
    print(randomNumber);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Image(image: AssetImage('images/dice$randomNumber.png'))),
          SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              randNUmber();
            },
            child: Text('Click me!'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Change the background color
              onPrimary: Colors.white, // Change the text color
            ),
          ),
        ],
      ),
    );
  }
}
