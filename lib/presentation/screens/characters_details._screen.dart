import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty_app/business_logic/cubit/characters_cubit.dart';
import 'package:rickandmorty_app/constants/my_colors.dart';
import 'package:rickandmorty_app/data/models/character.dart';

class CharactersDetailsScreen extends StatelessWidget {
  final Character character;
  const CharactersDetailsScreen({super.key, required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 700,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.name,
          style: const TextStyle(
              color: MyColors.white, fontWeight: FontWeight.bold, fontSize: 28),
          // textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.white,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Widget buidDivider(double endIndent) {
    return Divider(
      color: MyColors.Yellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  Widget checkIfQuotesAreLoaded(CharactersState state) {
    if (state is QuotesLoaded) {
      return displayRandomQuotesOrEmptySpace(state);
    } else {
      return showProgressIndicator();
    }
  }

  Widget displayRandomQuotesOrEmptySpace(state) {
    var quotes = state.quotes;
    if (quotes.isNotEmpty) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);

      return Center(
        child: DefaultTextStyle(
            textAlign: TextAlign.center,
            style:
                const TextStyle(fontSize: 20, color: MyColors.white, shadows: [
              Shadow(
                blurRadius: 7,
                color: MyColors.Yellow,
                offset: Offset(0, 0),
              )
            ]),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FlickerAnimatedText(quotes[randomQuoteIndex].quote),
              ],
            )),
      );
    } else {
      return Container();
    }
  }

  Widget showProgressIndicator() {
    return const Center(
        child: CircularProgressIndicator(
      color: MyColors.Yellow,
    ));
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getQuotes('lelouch');
    return Scaffold(
      backgroundColor: MyColors.grey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Status : ', character.status),
                      buidDivider(315),
                      characterInfo('Species : ', character.species),
                      buidDivider(305),
                      character.type == ''
                          ? Container()
                          : characterInfo('Type : ', character.type),
                      character.type == '' ? Container() : buidDivider(320),
                      characterInfo('Gender : ', character.gender),
                      buidDivider(305),
                      characterInfo('Origin : ', character.origin.name!),
                      buidDivider(315),
                      characterInfo('Location : ', character.location.name!),
                      buidDivider(305),
                      characterInfo(
                          'Episodes : ', character.episodeNumbers.join(' / ')),
                      buidDivider(290),
                      const SizedBox(height: 20)
                    ],
                  ),
                ),
                // const SizedBox(height: 400),
                BlocBuilder<CharactersCubit, CharactersState>(
                  builder: (context, state) {
                    return Center(child: checkIfQuotesAreLoaded(state));
                  },
                ),
                const SizedBox(height: 400),
              ],
            ),
          )
        ],
      ),
    );
  }
}
