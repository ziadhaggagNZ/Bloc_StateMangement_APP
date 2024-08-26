import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../constants/strings.dart';
import '../../data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Results character;
  final int index;

  const CharacterItem({super.key, required this.character, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, CharactarDetailsScreen , arguments:character ),
        child: GridTile(
          child: Hero(
            tag: character.id!,
            child: Container(
              color: MyColors.myGrey,
              child: character.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      height: double.infinity,
                      width: double.infinity,
                      placeholder: "assets/images/loading.gif",
                      image: character.image!,
                      fit: BoxFit.cover,
                    )
                  : const Center(child: Text("Image Error!")),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              "${character.name ?? 'Unknown'}",
              style: TextStyle(
                  height: 1.3,
                  fontSize: 16,
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

















// import 'package:flutter/material.dart';
// import 'package:flutter_breaking/constants/my_colors.dart';
// import 'package:flutter_breaking/data/models/characters.dart';

// class CharacterItem extends StatelessWidget {
//   final Character character;
//   final int index;

//   const CharacterItem({super.key, required this.character , required this.index});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
//       padding: EdgeInsetsDirectional.all(4),
//       decoration: BoxDecoration(
//         color: MyColors.myWhite,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: GridTile(
//         child: Container(
//           color: MyColors.myGrey,
//           child: character.results![index].image!.isNotEmpty
//               ? FadeInImage.assetNetwork(
//                   height: double.infinity,
//                   width: double.infinity,
//                   placeholder: "assets/images/loading.gif",
//                   image: character.results![index].image!,
//                   fit: BoxFit.cover,
//                 )
//               : const Center(child: Text("Image Error !")),
//         ),
//         footer: Container(
//           width: double.infinity,
//           padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           color: Colors.black54,
//           alignment: Alignment.bottomCenter,
//           child: Text(
//             "${character.results![index].name }",
//             style: TextStyle(
//                 height: 1.3,
//                 fontSize: 16,
//                 color: MyColors.myWhite,
//                 fontWeight: FontWeight.bold),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//                 textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }
