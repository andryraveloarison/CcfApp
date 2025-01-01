import 'package:flutter/material.dart';
import '../utils/utils.dart'; // Importer la fonction loadSong
import 'song_details_screen.dart'; // Importer SongDetailsScreen

class SongListScreen extends StatefulWidget {
  const SongListScreen({super.key});

  @override
  _SongListScreenState createState() => _SongListScreenState();
}

class _SongListScreenState extends State<SongListScreen> {
  final List<String> _songList = [
    'Attire-moi à Toi',
    'Au dessus de tout',
    'Avec la foi',
    'C\'est en Toi',
    'Cherchez d\'abord le Royaume de Dieu',
    'Dans ta main',
    'Entends mon coeur',
    'En Toi Seigneur',
    'Face à Face',
    'Il est exalté',
    'Je loue Ton Nom Eternel',
    'Jésus, c\'est le plus beau nom',
    'Je veux n\'être qu\'à toi',
    'Je veux t\'adorer',
    'Le Seigneur nous a aimés',
    'Les enfants de Dieu',
    'Lumière du monde',
    'Merci à Toi',
    'Mon coeur ta demeure',
    'Qu\'il en soit ainsi',
    'Reçois l\'adoration',
    'Tu es le chant',
    'Tu est mon tout en tout',
    'Un seul Dieu',  
    // Ajoutez d'autres chansons ici si nécessaire
  ];

  List<String> _filteredSongs = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredSongs = _songList;
  }

  void _filterSongs(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredSongs = _songList;
      } else {
        _filteredSongs = _songList
            .where((song) => song.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculer la largeur de la barre de recherche (96% de la largeur de l'écran)
    double screenWidth = MediaQuery.of(context).size.width;
    double searchBarWidth = screenWidth * 0.96;

    double titleFontSize = screenWidth * 0.05; // Par exemple, 5% de la largeur de l'écran


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Liste des chansons',
          style: TextStyle(
            fontFamily: 'Roboto', // Utilisation de la police Roboto
            fontWeight: FontWeight.bold, // Mettre le texte en gras
            
          ),
          
        ),
        backgroundColor: Color(0xFFDF8700), // Utilisation du code hexadécimal

      ),
      body: Column(
        children: [
          // Barre de recherche avec hauteur réduite et taille de police réduite
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: searchBarWidth, // Utiliser la largeur calculée
              child: TextField(
                style: const TextStyle(fontSize: 14, fontFamily: 'Roboto'), // Appliquer la police personnalisée
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  hintStyle: const TextStyle(fontSize: 14, fontFamily: 'Roboto'), // Appliquer la police personnalisée au texte du hint
                  contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5), // Diminuer la hauteur de la barre
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: _filterSongs, // Met à jour la liste des chansons pendant la recherche
              ),
            ),
          ),

          // Liste des chansons
          Expanded(
            child: ListView.builder(
              itemCount: _filteredSongs.length,
              itemBuilder: (context, index) {
                final songName = _filteredSongs[index];
                return ListTile(
                  title: Text('${index + 1} -  $songName', style: const TextStyle(fontFamily: 'Roboto')), // Appliquer la police personnalisée
                  onTap: () async {
                    // Charger les paroles de la chanson
                    // Naviguer vers la page des détails de la chanson
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SongDetailsScreen(songName: songName),
                      ),
                    );

                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

