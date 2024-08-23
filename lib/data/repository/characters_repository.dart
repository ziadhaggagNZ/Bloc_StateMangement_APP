import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository({required this.charactersWebServices});

  Future<List<Map<String, dynamic>>> getAllCharacters() async {
    try {
      final List<dynamic> characters = await charactersWebServices.getAllCharacters();

      if (characters.isNotEmpty) {
        return characters.cast<Map<String, dynamic>>(); // Ensure the list is of type Map<String, dynamic>
      } else {
        print("No characters found.");
        return [];
      }
    } catch (e) {
      print("Error in getAllCharacters: $e");
      return [];
    }
  }
}



// import 'package:flutter_breaking/data/models/characters.dart';
// import 'package:flutter_breaking/data/web_services/characters_web_services.dart';


// class CharactersRepository {


//     final CharactersWebServices charactersWebServices;

//   CharactersRepository({required this.charactersWebServices});

// Future<List<Character>> getAllCharacters() async {
//   final characters = await charactersWebServices.getAllCharacters();
  
//   return characters.map((character) => Character.fromJson(character)).toList();
// }

// }