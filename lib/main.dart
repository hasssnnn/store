import 'package:flutter/material.dart';

import 'screens/add_product_screen.dart';
import 'screens/home_page.dart';
import 'screens/update_product_screen.dart';


void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProductScreen.id: (context) =>const UpdateProductScreen(),
        AddProductScreen.id:(context)=> const AddProductScreen()
      },
      initialRoute: HomePage.id,
      debugShowCheckedModeBanner: false,
    );
  }
}
