import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});
  static String id = 'AddProductScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading...',style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500
        ),)
        
        ),
    );
  }
}