import 'package:flutter/services.dart' as services;

Future<String> loadSong(String songName) async {
  return await services.rootBundle.loadString('lib/lyrics/$songName.txt');
}
