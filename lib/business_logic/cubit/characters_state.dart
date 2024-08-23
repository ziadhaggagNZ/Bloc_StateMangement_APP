part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoaded extends CharactersState {
  final List<Results> characters;

  CharactersLoaded({required this.characters});
}

class CharactersError extends CharactersState {
  final String message;

  CharactersError(this.message);
}




// part of 'characters_cubit.dart';

// @immutable
// sealed class CharactersState {}

// final class CharactersInitial extends CharactersState {}



// class CharactersLoaded extends CharactersState{
//   final List<Character> Characters;

//   CharactersLoaded({required this.Characters});
// }