import 'package:flutter/material.dart';
import 'package:CCF/screens/song_list_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      backgroundColor: const Color(0xFFdf8700), // Couleur personnalisée
      body: Stack(
        children: [
          // Image centrée avec la hauteur calculée
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: (screenHeight / 2 - 200).clamp(0.0, double.infinity)),
              child: Image.asset(
                'lib/assets/images/splash.png', // Remplacez par le chemin de votre image
                width: 200,
                height: 200,
              ),
            ),
          ),
          // Texte en bas avec position absolue
          Positioned(
            bottom: 10, // Distance du bas de l'écran
            left: 0,
            right: 0,
            child: Text(
              '©Nananjy', // Le texte à afficher en bas
              textAlign: TextAlign.center, // Centre le texte horizontalement
              style: const TextStyle(
                fontSize: 11, // Taille du texte
                color: Colors.black, // Couleur du texte
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
