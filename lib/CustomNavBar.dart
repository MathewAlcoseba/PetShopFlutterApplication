import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import 'package:petshop/CartPage.dart';
import 'package:petshop/HomePage.dart';
import 'package:petshop/PetDetailsPage.dart';
import 'package:petshop/PetStoreHomePage.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const CustomBottomNavbar({
    Key? key,
    this.currentIndex = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildSvgIcon(
              'homeIcon.svg',
              currentIndex == 0 ? Color(0xFFE8BE13) : Color(0xFF808080),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(
              'catalogIcon.svg',
              currentIndex == 1 ? Color(0xFFE8BE13) : Color(0xFF808080),
            ),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(
              'cartIcon.svg',
              currentIndex == 2 ? Color(0xFFE8BE13) : Color(0xFF808080),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(
              'profileIcon.svg',
              currentIndex == 3 ? Color(0xFFE8BE13) : Color(0xFF808080),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Color(0xFFE8BE13),
        onTap: (index) {
          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PetStoreHomePage()),
            );
          } else if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PetProfile()),
            );
          } else {
            onTap?.call(index);
          }
        },
      ),
    );
  }

  Widget _buildSvgIcon(String assetName, Color color) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      child: SvgPicture.asset(assetName),
    );
  }
}
