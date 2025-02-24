import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rickandmorty_app/data/models/character.dart';
import 'package:rickandmorty_app/data/models/quote.dart';
import 'package:rickandmorty_app/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;

  List<Character> characters = [];

  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });

    return characters;
  }

  void getQuotes(String charName) {
    charactersRepository.getCharactersQuotes(charName).then((quotes) {
      emit(QuotesLoaded(quotes));
    });
  }
}
