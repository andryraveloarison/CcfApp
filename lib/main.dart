import 'dart:io'; // Ajouter l'importation de dart:io pour utiliser Platform
import 'package:CCF/screens/home_page_screen.dart';
import 'package:flutter/material.dart';

void main() {


  runApp(ChoraleApp());
}

class ChoraleApp extends StatelessWidget {
  const ChoraleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chorale App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(), // Écran de liste des chansons
    );
  }
}
