import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_breaking/data/models/characters.dart';
import 'package:meta/meta.dart';
import 'package:flutter_breaking/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {


  final CharactersRepository  charactersRepository;
  late List<Character> characters;

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters(){
    charactersRepository.getAllCharacters().then((Characters){
      emit(CharactersLoaded(Characters: Characters));
      this.characters = characters;
    });
    return characters;
  }
}
