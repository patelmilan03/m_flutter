import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BallPage());
}

class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF1C1B1F),
        appBar: AppBar(
          title: const Center(
            child: Text('Ask Me ANYTHING'),
          ),
          backgroundColor: const Color(0xFF6693F5),
        ),
        body: const magic8ball(),
      ),
    );
  }
}

class magic8ball extends StatefulWidget {
  const magic8ball({super.key});

  @override
  State<magic8ball> createState() => _magic8ballState();
}

class _magic8ballState extends State<magic8ball> {
  int randomnum = 1;

  void randomize() {
    setState(() {
      randomnum = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              randomize();
            },
            child: Image.asset('images/ball$randomnum.png'),
          ),
          //
          const SizedBox(width: 1000, height: 10),
          //
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF6693F5),
            ),
            onPressed: () {
              randomize();
            },
            child: Text(
              'Push to ask',
              style: GoogleFonts.sourceSans3(
                textStyle: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
