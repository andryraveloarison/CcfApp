import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:webview_flutter/webview_flutter.dart';

Future<String> loadSong(String songName) async {
  return await services.rootBundle.loadString('lib/lyrics/$songName.txt');
}

class SongDetailsScreen extends StatefulWidget {
  final String songName;

  const SongDetailsScreen({super.key, required this.songName});

  @override
  _SongDetailsScreenState createState() => _SongDetailsScreenState();
}

class _SongDetailsScreenState extends State<SongDetailsScreen> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    // Initialisation du WebView
    WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: loadSong(widget.songName), // Charger les paroles depuis le fichier
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

        final lyrics = snapshot.data ?? "";

        return Scaffold(
          appBar: AppBar(
            title: Text(widget.songName),
            backgroundColor: const Color(0xFFDF8700),
          ),
          body: WebView(
            initialUrl: Uri.dataFromString(
              lyrics,
              mimeType: 'text/html',
              encoding: Encoding.getByName('utf-8'),
            ).toString(),
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webViewController = webViewController;
            },
          ),
        );
      },
    );
  }
}
