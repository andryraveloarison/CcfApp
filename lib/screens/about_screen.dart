import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos',
         style: TextStyle(
            fontWeight: FontWeight.bold
          )),
        backgroundColor: const Color(0xFFDF8700),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Icône de retour
          onPressed: () {
            Navigator.pop(context); // Action pour revenir à la page précédente
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight, // Assure que la hauteur minimale correspond à l'écran
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Image centrée horizontalement
                    Image.asset(
                      'lib/assets/images/LOGO.png', // Remplacez par le chemin de votre image
                      fit: BoxFit.cover, // Ajuste l'image pour qu'elle remplisse l'espace
                      height: 200, // Hauteur de l'image
                      width: 200, // Largeur maximale
                    ),
                    const SizedBox(height: 20), // Espacement entre l'image et le texte
                    // Texte centré
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'CCF est une application dédiée aux membres du Chœur du Christ en Famille.\n\n'
                        'Elle permet d\'afficher les paroles des chansons chantées lors des cultes, des répétitions ou des événements spéciaux.\n\n',
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center, // Centrer le texte horizontalement
                      ),
                    ),
                    const Spacer(), // Pousse la signature vers le bas
                    // Signature en bas
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Made with 🖤', // Remplacez par votre signature
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center, // Centrer la signature
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
