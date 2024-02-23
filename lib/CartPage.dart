import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petshop/CustomNavBar.dart'; // Import your custom navigation bar widget
import 'package:petshop/PetStoreProvider.dart';
import 'package:provider/provider.dart'; // Import your PetStoreProvider

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: GoogleFonts.poppins(),
        ),
        centerTitle: true,
      ),
      body: Consumer<PetStoreProvider>(
        builder: (context, provider, child) {
          return provider.cartItems.isEmpty
              ? Center(
                  child: Text(
                    'Your cart is empty',
                    style: GoogleFonts.poppins(),
                  ),
                )
              : ListView.builder(
                  itemCount: provider.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = provider.cartItems[index];
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.09),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Image.asset(
                          item['image'],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          item['name'],
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          item['price'],
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_circle),
                          onPressed: () {
                            provider.removeFromCart(
                                index); // Call the method to remove item from cart
                          },
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: 2, // Provide the current index value
        onTap: (index) {
          // Handle navigation here
        },
      ),
    );
  }
}
