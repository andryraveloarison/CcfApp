import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:html/parser.dart' as html_parser;

Future<String> loadSong(String songName) async {
  return await services.rootBundle.loadString('lib/lyrics/$songName.txt');
}

class SongDetailsScreen extends StatelessWidget {
  final String songName;

  const SongDetailsScreen({super.key, required this.songName});

  List<TextSpan> parseLyrics(String lyrics) {
    final document = html_parser.parse(lyrics);
    final elements = document.body?.nodes ?? [];

    return elements.map((node) {
      if (node.nodeType == 3) {
        // Text Node
        return TextSpan(text: node.text, style: const TextStyle(fontWeight: FontWeight.normal));
      } else if (node.localName == 'b') {
        // Bold Text Node
        return TextSpan(text: node.text, style: const TextStyle(fontWeight: FontWeight.bold));
      } else {
        return const TextSpan(text: '');
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: loadSong(songName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Erreur de chargement des paroles')),
          );
        }

        final lyrics = snapshot.data ?? "Pas de paroles disponibles.";

        return Scaffold(
          appBar: AppBar(
            title: Text(
              songName,
              style: const TextStyle(
                fontSize: 22, // Taille de la police
                fontWeight: FontWeight.bold, // Gras
                color: Colors.black, // Couleur du texte
                fontFamily: 'Roboto', // Exemple de police personnalisée
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFFDF8700),
            
          ),
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: double.infinity, // Utiliser toute la largeur disponible
                child: RichText(
                  textAlign: TextAlign.left, // Aligner le texte à gauche
                  text: TextSpan(
                    children: parseLyrics(lyrics),
                    style: const TextStyle(color: Colors.black, fontSize: 16.0, height: 1.5),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
