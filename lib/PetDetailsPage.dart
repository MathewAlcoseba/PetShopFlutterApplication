import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: PetProfile(),
    );
  }
}

class PetProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
                'path/to/your/sphynx_cat_image.png'), // Replace with your image path
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sphyix Cat',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE8BE13),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Canada · 8m',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoChip(label: 'Affectionate'),
                      InfoChip(label: 'Intelligent'),
                      InfoChip(icon: Icons.expand_more, label: 'More Info'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'The Sphynx cat, hairless and charming, boasts a velvety skin in various colors and patterns. Playful and affectionate, they capture hearts with their unique appearance and lively personalities.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.pets, color: Color(0xFFE8BE13)),
                    title: Text('Sphinx behavior'),
                    subtitle: Text('Affectionate · Intelligent'),
                    trailing: Icon(Icons.expand_more, color: Color(0xFFE8BE13)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoChip extends StatelessWidget {
  final String label;
  final IconData? icon;

  InfoChip({required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: icon != null ? Icon(icon, color: Color(0xFFE8BE13)) : null,
      label: Text(label),
      backgroundColor: Color(0xFFE8BE13).withOpacity(0.2),
      labelStyle: TextStyle(color: Color(0xFFE8BE13)),
    );
  }
}
