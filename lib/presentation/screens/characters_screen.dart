import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/business_logic/cubit/characters_cubit.dart';
import 'package:rickandmorty_app/constants/my_colors.dart';
import 'package:rickandmorty_app/data/models/character.dart';
import 'package:rickandmorty_app/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;

  @override
  void initState() {
    super.initState();
    allCharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  } // ui asks bloc for data   wakes it up bec it's lazy

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
      if (state is CharactersLoaded) {
        allCharacters = (state).characters;
        return buildLoadedListWidgets();
      } else {
        return showLoadingIndicator();
      }
    });
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.Yellow,
      ),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.grey,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics:  const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: allCharacters.length,
        itemBuilder: (context, index) {
          return const CharacterItem();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.Yellow,
        title: const Text(
          'Characters',
          style: TextStyle(color: MyColors.grey),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
