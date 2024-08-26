import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../data/models/characters.dart';
import 'package:flutter_offline/flutter_offline.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Results character;
  const CharacterDetailsScreen({super.key, required this.character});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.name!,
          style: TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
            tag: character.id!,
            child: Image.network(
              character.image!,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
            text: title,
            style: TextStyle(
              color: MyColors.myWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        TextSpan(
            text: value,
            style: TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ))
      ]),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      color: MyColors.myYellow,
      height: 30,
      endIndent: endIndent,
      thickness: 2,
    );
  }

  Widget buildBlocWidhet() {
    return CustomScrollView(
      slivers: [
        buildSliverAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                characterInfo("status : ", character.status!),
                buildDivider(300),
                characterInfo("gender : ", character.gender!),
                buildDivider(290),
                characterInfo("created : ", character.created!),
                buildDivider(290),
                characterInfo("species : ", character.species!),
                buildDivider(290),
                SizedBox(
                  height: 500,
                ),
              ],
            ),
          ),
        ]))
      ],
    );
  }

  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: MyColors.myWhite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Can't connect .. checK internet",
              style: TextStyle(fontSize: 22, color: MyColors.myGrey),
            ),
            Image.asset("assets/images/no_internet.jpg"),
          ],
        ),
      ),
    );
  }
  Widget showLoadingIndicator(){
    return Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.myGrey,
        body: OfflineBuilder(connectivityBuilder: (
          BuildContext context,
          List<ConnectivityResult> connectivity,
          Widget child,
        ) {
          final bool connected =
              !connectivity.contains(ConnectivityResult.none);
          if (connected) {
            return buildBlocWidhet();
          } else {
            return buildNoInternetWidget();
          }
        },
        child: showLoadingIndicator(),
        )
        );
  }
}
