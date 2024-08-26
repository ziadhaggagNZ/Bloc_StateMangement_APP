import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/characters_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/characters.dart';
import '../widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Results> allCharacters;
  List<Results> searchedForCharacters = [];
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  Widget _buildSearchFeild() {
    return TextField(
      controller: _searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: "Find a character...",
        border: InputBorder.none,
        hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18),
      ),
      style: TextStyle(color: MyColors.myGrey, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearcherForItemsToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearcherForItemsToSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBarActions() {
    if (_isSearching) {
      return [
        IconButton(
            onPressed: () {
              _clearSearch();
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.clear,
              color: MyColors.myGrey,
            )),
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearch,
            icon: Icon(
              Icons.search,
              color: MyColors.myGrey,
            )),
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearch();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearch() {
    _searchTextController.clear();
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

Widget _buildAppBarTitle(){
  return Center(
    child: Text(
            "Characters",
            style: TextStyle(color: MyColors.myGrey),
          ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title:  _isSearching ? _buildSearchFeild() : _buildAppBarTitle(),
        actions: _buildAppBarActions(),
      ),
      body: BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = state.characters;
            return buildLoadedListWidgets(allCharacters ,searchedForCharacters);
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

  Widget buildLoadedListWidgets(List<Results> resultsAll , List<Results> resultsSearch) {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [
            buildCharactersList(resultsAll , resultsSearch),
          ],
        ),
      ),
    );
  }

  Widget buildCharactersList(List<Results> resultsAll , List<Results> resultsSearch) {
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
      itemCount: _searchTextController.text.isEmpty ? resultsAll.length : resultsSearch.length ,
      itemBuilder: (context, index) {
        return CharacterItem(character: _searchTextController.text.isEmpty ? resultsAll[index] : resultsSearch[index], index: index);
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
