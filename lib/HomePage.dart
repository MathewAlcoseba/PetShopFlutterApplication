import 'package:flutter/material.dart';
import 'package:petshop/CustomNavBar.dart'; // Import the CustomBottomNavbar widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 5,
          margin: EdgeInsets.zero, // Remove padding or margin around the card
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.14159), // Horizontal flip
                child: Image.asset(
                  'cat4.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    top: 147,
                    left: 0,
                    child: Container(
                      width: 241,
                      height: 363,
                      decoration: BoxDecoration(
                        color: Color(0xFFE8BE13),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 270,
                    left: 30,
                    child: Center(
                      child: Text(
                        'WELCOME',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 52,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 35,
                top: 340,
                child: Text(
                  '''meow've been 
expecting you!''',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 0, // Provide the current index value
        onTap: (index) {
          // Handle navigation here
        },
      ),
    );
  }
}
