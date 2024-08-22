import 'package:flutter/material.dart';
import 'package:flutter_breaking/presentation/screens/characters_details.dart';
import 'package:flutter_breaking/presentation/screens/characters_screen.dart';

import 'constants/strings.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings)
  {
    switch(settings.name){
      case CharactarScreen:
      return MaterialPageRoute(builder: (_) => CharactersScreen());

      case CharactarDetailsScreen:
      return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());

    }
  }
}