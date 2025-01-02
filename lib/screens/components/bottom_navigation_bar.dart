import 'package:flutter/material.dart';
import '../song_list_screen.dart';
import '../about_screen.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;

  const BottomNavigationBarWidget({
    Key? key,
    required this.currentIndex, // Ajouter le currentIndex
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex, // Ajouter le currentIndex ici
      backgroundColor: const Color(0xFFDF8700), // Couleur de fond
      selectedItemColor: Colors.white, // Couleur pour l'élément sélectionné
      unselectedItemColor: Color.fromARGB(255, 0, 0, 0), // Couleur pour les éléments non sélectionnés
      type: BottomNavigationBarType.fixed, // Comportement uniforme
      showUnselectedLabels: false, // Masquer les labels non sélectionnés
      showSelectedLabels: false, // Masquer les labels sélectionnés
      onTap: (index) {
        // Si l'utilisateur est déjà sur la page actuelle, ne rien faire
        if (index == currentIndex) return;

        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const SongListScreen()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AboutScreen()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note),
          label: '', // Label vide
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: '', // Label vide
        ),
      ],
    );
  }
}
