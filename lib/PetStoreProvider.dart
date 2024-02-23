import 'package:flutter/material.dart';

class PetStoreProvider extends ChangeNotifier {
  String _searchQuery = '';
  List<Map<String, dynamic>> _filteredPets = pets;
  List<Map<String, dynamic>> _cartItems = [];

  void setSearchQuery(String query) {
    _searchQuery = query;
    _filterPets();
    notifyListeners();
  }

  List<Map<String, dynamic>> get filteredPets => _filteredPets;
  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addToCart(Map<String, dynamic> pet) {
    _cartItems.add(pet);
    notifyListeners();
  }

  void removeFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void _filterPets() {
    if (_searchQuery.isEmpty) {
      _filteredPets = List.from(pets);
    } else {
      _filteredPets = pets.where((pet) {
        String name = pet['name'].toLowerCase();
        return name.contains(_searchQuery.toLowerCase());
      }).toList();
    }
  }
}

const List<Map<String, dynamic>> pets = [
  {'name': 'Persian Cat', 'price': '\$85', 'image': 'persianCat.jpg'},
  {'name': 'Sphinx Cat', 'price': '\$60', 'image': 'sphinxCat.jpg'},
  {'name': 'Bengal Cat', 'price': '\$90', 'image': 'bengalCat.jpg'},
  {'name': 'Abyssinian Cat', 'price': '\$75', 'image': 'abyssinianCat.jpg'},
  {'name': 'Burmese Cat', 'price': '\$75', 'image': 'burmeseCat.jpg'},
  {'name': 'Russian Blue Cat', 'price': '\$60', 'image': 'russianblueCat.jpg'},
];
