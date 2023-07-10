import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF1C1B1F),
        appBar: AppBar(
          title: const Center(
            child: Text('Dicee'),
          ),
          backgroundColor: Color(0xFF4F378B),
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftdicenum = 2;
  int rightdicenum = 3;

  void randomize() {
    setState(() {
      leftdicenum = 1 + Random().nextInt(6);
      rightdicenum = 1 + Random().nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {
                      randomize();
                    },
                    child: Image.asset('images/dice$leftdicenum.png')),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    randomize();
                  },
                  child: Image.asset('images/dice$rightdicenum.png'),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 1000,
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFD0BCFF),
            ),
            onPressed: () {
              randomize();
            },
            child: Text(
              'PUSH TO ROLL',
              style: GoogleFonts.sourceSans3(
                textStyle: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF381E72),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
