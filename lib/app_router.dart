import 'package:flutter/material.dart';
import 'package:rickandmorty_app/constants/Strings.dart';
import 'package:rickandmorty_app/presentation/screens/characters_details._screen.dart';
import 'package:rickandmorty_app/presentation/screens/characters_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CharactersScreen:
        return MaterialPageRoute(builder: (_) => CharactersScreen());

        case charactersDetailsScreen:
        return MaterialPageRoute(builder: (_) => CharactersDetailsScreen());
        
    }
    
  }
}
