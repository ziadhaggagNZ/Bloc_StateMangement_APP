import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/data/repository/characters_repository.dart';
import 'package:flutter_breaking/data/web_services/characters_web_services.dart';
import 'package:flutter_breaking/presentation/screens/characters_details_screen.dart';
import 'package:flutter_breaking/presentation/screens/characters_screen.dart';

import 'constants/strings.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository =
        CharactersRepository(charactersWebServices: CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CharactarScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext) =>
                    charactersCubit,
                    child: CharactersScreen(),
                    ));

      case CharactarDetailsScreen:
      final character = settings.arguments as Results;
       return MaterialPageRoute(builder: (_) => CharacterDetailsScreen(character : character));
    }
    return null;
  }
}
