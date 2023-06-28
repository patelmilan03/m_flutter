import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(shweesh());
}

class shweesh extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF1C1B1F),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 60.0,
                backgroundColor: Colors.white,
                backgroundImage: const AssetImage('images/luffy1.png'),
              ),
              //
              Text(
                'Milan Patel',
                style: GoogleFonts.rockSalt(
                  textStyle: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //
              Text(
                'STUDENT',
                style: GoogleFonts.shareTechMono(
                  textStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade400,
                    letterSpacing: 3,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //
              SizedBox(
                width: 120.0,
                height: 20.0,
                child: Divider(
                  color: Color(0xFFD0BCFF),
                ),
              ),
              //
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                //padding: EdgeInsets.all(5.0),
                color: Color(0xFF633B48),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.email_rounded,
                      color: Color(0xFFFFD8E4),
                      size: 30,
                    ),
                    title: Text(
                      'milan2003patel@gmail.com',
                      style: GoogleFonts.sourceSans3(
                        textStyle: TextStyle(
                          fontSize: 17,
                          color: Color(0xFFFFD8E4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //
              const SizedBox(
                width: 1000.0,
                height: 10.0,
              ),
              //
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                //padding: EdgeInsets.all(5.0),
                color: Color(0xFF633B48),
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                      color: Color(0xFFFFD8E4),
                      size: 30,
                    ),
                    title: Text(
                      '+91 9876543210',
                      style: GoogleFonts.sourceSans3(
                        textStyle: TextStyle(
                          fontSize: 17,
                          color: Color(0xFFFFD8E4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //
              const SizedBox(
                width: 1000.0,
                height: 10.0,
              ),
              //
              Card(
                margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
                //padding: EdgeInsets.all(5.0),
                color: Color(0xFF633B48),
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: ListTile(
                    leading: const Icon(
                      Icons.account_circle_rounded,
                      color: Color(0xFFFFD8E4),
                      size: 30,
                    ),
                    title: Text(
                      'github.com/theretardednoob',
                      style: GoogleFonts.sourceSans3(
                        textStyle: TextStyle(
                          fontSize: 17,
                          color: Color(0xFFFFD8E4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
