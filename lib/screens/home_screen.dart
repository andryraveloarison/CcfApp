import 'package:flutter/material.dart';
import 'package:CCF/screens/song_list_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double screenHeight;

  @override
  void initState() {
    super.initState();

    // Naviguer vers la liste des chansons après 1 seconde avec une animation
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 2), // Durée de la transition
          pageBuilder: (context, animation, secondaryAnimation) =>
              const SongListScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.easeInOut;

            final tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve),
            );
            final fadeAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: fadeAnimation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Calculer la hauteur de l'écran
    screenHeight = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final imageWidth = screenWidth.clamp(230.0,290.0); // Min 200, Max 3R00

    return Scaffold(
      backgroundColor: Color(0xFFE28413), // Couleur personnalisée
      body: Stack(
        children: [
          // Image centrée avec la hauteur calculée
         Center(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: (screenHeight / 2 - 220).clamp(0.0, double.infinity),
            ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Permet à la colonne de s'ajuster à la taille de son contenu
          children: [
            Image.asset(
              'lib/assets/images/splash.png', // Remplacez par le chemin de votre image
              width: imageWidth,
              height: imageWidth,
            ),
        SizedBox(height: 1), // Espacement entre l'image et le texte
        Text(
          'v1.1.3', // Remplacez par le texte souhaité
          style: TextStyle(
            fontSize: 12, // Taille de la police
            color: Color.fromARGB(255, 83, 83, 83), // Couleur du texte
          ),
        ),
      ],
    ),
  ),
),

          // Texte en bas avec position absolue
          Positioned(
            bottom: 5, // Distance du bas de l'écran
            left: 0,
            right: 0,
            child: Text(
              'CCF © 2025', // Le texte à afficher en bas
              textAlign: TextAlign.center, // Centre le texte horizontalement
              style: const TextStyle(
                fontSize: 11, // Taille du texte
                color: Color(0XFF000022), // Couleur du texte
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
