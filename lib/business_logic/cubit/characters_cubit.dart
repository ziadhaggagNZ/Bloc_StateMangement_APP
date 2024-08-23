import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breaking/data/models/characters.dart';
import 'package:meta/meta.dart';
import 'package:flutter_breaking/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  void getAllCharacters() async {
    try {
      final List<dynamic> fetchedCharactersList = await charactersRepository.getAllCharacters();

      // Convert the fetched list to List<Results> safely
      final List<Results> charactersList = fetchedCharactersList
          .map((json) => Results.fromJson(json as Map<String, dynamic>))
          .toList();

      // Update the state with the fetched characters
      emit(CharactersLoaded(characters: charactersList));

      print("Characters Loaded: ${charactersList.length}");
    } catch (error) {
      print("Error fetching characters: $error");
      emit(CharactersError("Failed to fetch characters."));
    }
  }
}




// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_breaking/data/models/characters.dart';
// import 'package:meta/meta.dart';
// import 'package:flutter_breaking/data/repository/characters_repository.dart';

// part 'characters_state.dart';

// class CharactersCubit extends Cubit<CharactersState> {
//   final CharactersRepository charactersRepository;
//   List<Results> characters = [];  // Assuming you are now fetching `Results`

//   CharactersCubit(this.charactersRepository) : super(CharactersInitial());

//   void getAllCharacters() async {
//     try {
//       final charactersList = await charactersRepository.getAllCharacters();

//       // Update state and characters list only after data is fetched
//       characters = charactersList;
//       emit(CharactersLoaded(characters: characters));

//       print("Characters Loaded: ${characters.length}");
//     } catch (error) {
//       print("Error fetching characters: $error");
//       emit(CharactersError("Failed to fetch characters."));
//     }
//   }
// }





// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_breaking/data/models/characters.dart';
// import 'package:meta/meta.dart';
// import 'package:flutter_breaking/data/repository/characters_repository.dart';

// part 'characters_state.dart';

// class CharactersCubit extends Cubit<CharactersState> {


//   final CharactersRepository  charactersRepository;
//    List<Character> characters = [];

//   CharactersCubit(this.charactersRepository) : super(CharactersInitial());

//   List<Character> getAllCharacters(){
//     charactersRepository.getAllCharacters().then((Characters){
//       emit(CharactersLoaded(Characters: characters));
//       this.characters = characters;
//     });
//     print("11111111111111111111111");
//     print(characters.length);
//     return characters;
//   }
// }
