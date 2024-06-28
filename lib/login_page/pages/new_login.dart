import 'package:flutter/material.dart';

class LoPage extends StatelessWidget {
  const LoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("login"),),
        body: const Column(children: [
           Text("Login" , style: TextStyle(fontSize: 17 ,fontWeight: FontWeight.bold),)
        ],        ),

    );
  }
}