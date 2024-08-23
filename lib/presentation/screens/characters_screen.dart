import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_breaking/constants/my_colors.dart';
import 'package:flutter_breaking/data/models/characters.dart';
import 'package:flutter_breaking/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: Text(
          "Characters",
          style: TextStyle(color: MyColors.myGrey),
        ),
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            List<Results> allCharacters = state.characters;
            return buildLoadedListWidgets(allCharacters);
          } else if (state is CharactersError) {
            return Center(child: Text(state.message));
          } else {
            return showLoadingIndicator();
          }
        },
      ),
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget buildLoadedListWidgets(List<Results> results) {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(results),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList(List<Results> results) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: results.length,
      itemBuilder: (context, index) {
        return CharacterItem(character: results[index], index: index);
      },
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_breaking/business_logic/cubit/characters_cubit.dart';
// import 'package:flutter_breaking/constants/my_colors.dart';
// import 'package:flutter_breaking/data/models/characters.dart';
// import 'package:flutter_breaking/presentation/widgets/character_item.dart';

// class CharactersScreen extends StatefulWidget {
//   CharactersScreen({super.key});

//   @override
//   State<CharactersScreen> createState() => _CharactersScreenState();
// }

// class _CharactersScreenState extends State<CharactersScreen> {
//   late List<Character> allCharacters;

//   @override
//   void initState() {
//     super.initState();
//     allCharacters =
//         BlocProvider.of<CharactersCubit>(context).getAllCharacters();
//   }

//   Widget buildBlocWidget() {
//     return BlocBuilder<CharactersCubit, CharactersState>(
//       builder: (context, State) {
//         if (State is CharactersLoaded) {
//           allCharacters = State.Characters;
//           print("zzzzzzzzzzzzzzzzzzzzzzzz");
//           print(allCharacters.length);
//           return buildLoadedLostWidgets();
//         } else {
//           return showLoadingIndicator();
//         }
//       },
//     );
//   }

//   Widget showLoadingIndicator() {
//     return const Center(
//         child: CircularProgressIndicator(
//       color: MyColors.myYellow,
//     ));
//   }

//   Widget buildLoadedLostWidgets() {
//     return SingleChildScrollView(
//       child: Container(
//         color: MyColors.myGrey,
//         child: Column(
//           children: [
//             buildCharactersList(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildCharactersList() {
//     return GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             childAspectRatio: 2 / 3,
//             crossAxisSpacing: 1,
//             mainAxisSpacing: 1
//             ),
//         shrinkWrap: true,
//         physics: const ClampingScrollPhysics(),
//         padding: EdgeInsets.zero,
//         itemCount: allCharacters.length,
//         itemBuilder: (context, index) {
//           return CharacterItem(character: allCharacters[index],index: index,);
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: MyColors.myYellow,
//         title: Text(
//           "characters",
//           style: TextStyle(color: MyColors.myGrey),
//         ),
//       ),
//       body: buildBlocWidget(),
//     );
//   }
// }
