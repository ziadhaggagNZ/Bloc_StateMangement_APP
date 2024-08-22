import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_breaking/data/models/characters.dart';
import 'package:meta/meta.dart';
import 'package:flutter_breaking/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {


  final CharactersRepository  charactersRepository;
   List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters(){
    charactersRepository.getAllCharacters().then((Characters){
      emit(CharactersLoaded(Characters: characters));
      this.characters = characters;
    });
    print("11111111111111111111111");
    print(characters.length);
    return characters;
  }
}
