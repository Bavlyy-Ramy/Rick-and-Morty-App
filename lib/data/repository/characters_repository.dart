import 'package:rickandmorty_app/data/models/character.dart';
import 'package:rickandmorty_app/data/models/quote.dart';
import 'package:rickandmorty_app/data/web_services/characters_web_services.dart';

class CharactersRepository {
  final CharactersWebServices charactersWebServices;

  CharactersRepository({required this.charactersWebServices});

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersWebServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  Future<List<Quote>> getCharactersQuotes(String charName) async {
    final quotes = await charactersWebServices.getCharactersQuotes(charName);
    return quotes
        .map((charQuotes) => Quote.fromJson(charQuotes))
        .toList();
  }
}
