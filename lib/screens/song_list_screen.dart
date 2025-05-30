import 'package:flutter/material.dart';
import 'components/bottom_navigation_bar.dart';
import 'song_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
    'Dans Ta main',
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
    'Mon coeur Ta demeure',
    'Qu\'il en soit ainsi',
    'Reçois l\'adoration',
    'Tu es le chant',
    'Tu est mon tout en tout',
    'Un seul Dieu',
    'C\'est l\'air que je respire',
    'Louez, louez Gloire à Jésus',
    'Oui règne en moi',
    'Tout va bien'
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
      _filteredSongs = query.isEmpty
          ? _songList
          : _songList
              .where((song) => song.toLowerCase().contains(query.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des chansons',
          style: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
          ),
          centerTitle: true,
        backgroundColor: Color(0xFFE28413),
        
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Rechercher...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: _filterSongs,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredSongs.length,
              itemBuilder: (context, index) {
                final songName = _filteredSongs[index];
                return ListTile(
                  title: Text('${index + 1} - $songName'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SongDetailsScreen(songName: songName),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(currentIndex: 0),
    );
  }
}
