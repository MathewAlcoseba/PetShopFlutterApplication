import 'package:flutter/material.dart';
import 'package:petshop/HomePage.dart';
import 'package:petshop/PetDetailsPage.dart';
import 'package:petshop/PetStoreHomePage.dart';
import 'package:petshop/PetStoreProvider.dart';
import 'package:provider/provider.dart';
import 'package:petshop/CartPage.dart';
import 'package:petshop/loadingPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PetStoreProvider(),
      child: MaterialApp(
        home: LoadingPage(),
      ),
    );
  }
}
