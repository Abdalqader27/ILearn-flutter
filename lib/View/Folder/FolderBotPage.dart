import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilearn/Helper/Themes/appTheme.dart';
import 'package:ilearn/Helper/Widgets/staggered_category_card.dart';
import 'package:ilearn/Model/myCategory.dart';

import 'home_card_item.dart';

class FolderBotPage extends StatefulWidget {
  @override
  _FolderBotPageState createState() => _FolderBotPageState();
}

class _FolderBotPageState extends State<FolderBotPage> {
//   PageController _pageController;
//   int _pageIndex = 0;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _pageController = PageController(
//       initialPage: _pageIndex,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Positioned(
//               left: 24,
//               right: 0,
//               top: 24,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 54,
//                     width: 54,
//                     decoration:
//                     BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(16)),
//                     child: Center(
//                       child: Icon(Icons.keyboard_arrow_left),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 16, bottom: 3),
//                     child: Text(
//                       "Select a",
//                       style: GoogleFonts.montserrat(fontSize: 22),
//                     ),
//                   ),
//                   Text(
//                     "Plan To Learn",
//                     style: GoogleFonts.montserrat(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 22,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 12,
//                   ),
//                   SizedBox(
//                       width: MediaQuery.of(context).size.width / 1.2,
//                       child: Text(
//                         'Lorem ipsum dolor sit amet, consectetur adipisicing elit,'
//                             ' sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
//                         style: GoogleFonts.montserrat(fontSize: 12, color: Colors.grey),
//                       ))
//                 ],
//               ),
//             ),
//             Positioned(
//               right: -24,
//               top: 0,
//               child: Container(
//                 height: 120,
//                 width: 180,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: NetworkImage(
//                             "https://assets-ouch.icons8.com/thumb/208/447d3cc2-398c-4b4f-ba74-952639825135.png"),
//                         fit: BoxFit.cover)),
//               ),
//             ),
//             Positioned(
//               left: 16,
//               bottom: 16,
//               right: 16,
//               top: 240,
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: HomeCardItem(
//                             posSetting: true,
//                             title: "Conversation",
//                             borderRadiusGeometry: BorderRadius.only(
//                               topLeft: Radius.circular(160),
//                               topRight: Radius.circular(24),
//                               bottomRight: Radius.circular(24),
//                               bottomLeft: Radius.circular(24),
//                             ),
//                             cardColor: Colors.purple[400],
//                             img: "https://assets-ouch.icons8.com/thumb/742/18be8202-4db4-4fd8-bcf2-8db2deb63c63.png",
//                             topPosition: [8, 8, 0, 4],
//                             bottomPosition: [8, 8, 0, 4],
//                           ),
//                         ),
//                         Expanded(
//                           child: HomeCardItem(
//                             posSetting: true,
//                             title: "special topics",
//                             borderRadiusGeometry: BorderRadius.only(
//                               topLeft: Radius.circular(24),
//                               topRight: Radius.circular(160),
//                               bottomRight: Radius.circular(24),
//                               bottomLeft: Radius.circular(24),
//                             ),
//                             cardColor: Colors.red[400],
//                             img: "https://assets-ouch.icons8.com/thumb/631/32d26368-cc36-4f6f-bc6c-1309f8727bec.png",
//                             topPosition: [8, 8, 0, 4],
//                             bottomPosition: [16, 8, 16, 8],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: HomeCardItem(
//                             title: "Listening",
//                             borderRadiusGeometry: BorderRadius.only(
//                               topLeft: Radius.circular(24),
//                               topRight: Radius.circular(24),
//                               bottomRight: Radius.circular(24),
//                               bottomLeft: Radius.circular(160),
//                             ),
//                             cardColor: Colors.teal[400],
//                             img: "https://assets-ouch.icons8.com/thumb/276/af616f49-a851-4014-ad85-9ae9f25ae1bd.png",
//                             topPosition: [8, 8, 8, 0],
//                             bottomPosition: [16, 8, 16, 8],
//                           ),
//                         ),
//                         Expanded(
//                           child: HomeCardItem(
//                             title: "IELTS",
//                             borderRadiusGeometry: BorderRadius.only(
//                               topLeft: Radius.circular(24),
//                               topRight: Radius.circular(24),
//                               bottomRight: Radius.circular(160),
//                               bottomLeft: Radius.circular(24),
//                             ),
//                             cardColor: Colors.orange[200],
//                             img: "https://assets-ouch.icons8.com/thumb/853/0f654408-ed3c-4fea-812f-35185d116b98.png",
//                             topPosition: [8, 8, 8, 0],
//                             bottomPosition: [0, 8, 16, 8],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//   List<Category> categories = [
//     Category(
//       Color(0xffFCE183),
//       Color(0xffF68D7F),
//       'Gadgets',
//       'assets/jeans_5.png',
//     ),
//     Category(
//       Color(0xffF749A2),
//       Color(0xffFF7375),
//       'Clothes',
//       'assets/jeans_5.png',
//     ),
//     Category(
//       Color(0xff00E9DA),
//       Color(0xff5189EA),
//       'Fashion',
//       'assets/jeans_5.png',
//     ),
//     Category(
//       Color(0xffAF2D68),
//       Color(0xff632376),
//       'Home',
//       'assets/jeans_5.png',
//     ),
//     Category(
//       Color(0xff36E892),
//       Color(0xff33B2B9),
//       'Beauty',
//       'assets/jeans_5.png',
//     ),
//     Category(
//       Color(0xffF123C4),
//       Color(0xff668CEA),
//       'Appliances',
//       'assets/jeans_5.png',
//     ),
//   ];

  // List<Category> searchResults;
  // TextEditingController searchController = TextEditingController();
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   searchResults = categories;
  // }
  int indexWidgetParent = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // return Scaffold(
    //   backgroundColor: Colors.transparent,
    //   body: Container(
    //     padding: EdgeInsets.symmetric(horizontal: 16.0),
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: <Widget>[
    //         // Align(
    //         //   alignment: Alignment(-1, 0),
    //         //   child: Padding(
    //         //     padding: EdgeInsets.symmetric(vertical: 16.0),
    //         //     child: Text(
    //         //       'Category List',
    //         //       style: TextStyle(
    //         //         color: Colors.black,
    //         //         fontSize: 22,
    //         //         fontWeight: FontWeight.bold,
    //         //       ),
    //         //     ),
    //         //   ),
    //         // ),
    //         // Container(
    //         //   padding: EdgeInsets.only(left: 16.0),
    //         //   decoration: BoxDecoration(
    //         //     borderRadius: BorderRadius.all(Radius.circular(5)),
    //         //     color: Colors.white,
    //         //   ),
    //         //   child: TextField(
    //         //     controller:searchController,
    //         //     decoration: InputDecoration(
    //         //         border: InputBorder.none,
    //         //         hintText: 'Search',
    //         //         prefixIcon: SvgPicture.asset('assets/icons/search_icon.svg', fit: BoxFit.scaleDown,)
    //         //     ),
    //         //     onChanged: (value) {
    //         //       if(value.isNotEmpty) {
    //         //         List<Category> tempList = List<Category>();
    //         //         categories.forEach((category) {
    //         //           if(category.category.toLowerCase().contains(value)) {
    //         //             tempList.add(category);
    //         //           }
    //         //         });
    //         //         setState(() {
    //         //           searchResults.clear();
    //         //           searchResults.addAll(tempList);
    //         //         });
    //         //         return;
    //         //       } else {
    //         //         setState(() {
    //         //           searchResults.clear();
    //         //           searchResults.addAll(categories);
    //         //         });
    //         //       }
    //         //     },
    //         //   ),
    //         // ),
    //         Flexible(
    //           child: AnimationLimiter(
    //             child: ListView.builder(
    //               physics: BouncingScrollPhysics(),
    //               shrinkWrap: true,
    //               itemCount: searchResults.length,
    //               itemBuilder: (_, index) =>
    //                   // return AnimationConfiguration.staggeredList(
    //                   // position: index,
    //                   // duration: const Duration(milliseconds: 375),
    //                   // child: ScaleAnimation(
    //                   //   child: _item(index, data, context),
    //                   // ));
    //
    //                   Padding(
    //                 padding: EdgeInsets.symmetric(
    //                   vertical: 7.0,
    //                 ),
    //                 child: AnimationConfiguration.staggeredList(
    //                   position: index,
    //                   duration: const Duration(milliseconds: 500),
    //                   child: FadeInAnimation(
    //                     child: StaggeredCardCard(
    //                       begin: searchResults[index].begin,
    //                       end: searchResults[index].end,
    //                       categoryName: searchResults[index].category,
    //                       assetPath: searchResults[index].image,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          // physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: 50,
              width: double.maxFinite,
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back_ios,
                                    size: 15,
                                    color: AppTheme.black,
                                  ),
                                  Text(
                                    "$index كلية الهندسة المعلوماتية",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: listViewItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listViewItem() => ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          color: Colors.white.withOpacity(0.3),

          margin: EdgeInsets.all(0),
          shape: index == 0
              ? RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)))
              : index == 4 ? RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))) : null,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      indexWidgetParent = 1;
                    });
                  },
                  leading: indexWidgetParent == 0
                      ? SvgPicture.asset(
                          "SvgFiles/030-folder-10.svg",
                          width: 40,
                          height: 40,
                        )
                      : SvgPicture.asset(
                          "SvgFiles/pdf2.svg",
                          width: 40,
                          height: 40,
                        ),
                  trailing: indexWidgetParent != 0 ? Icon(Icons.arrow_forward_ios) : null,
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "الفيزياء  ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                index != 4
                    ? Divider(
                        height: 1,
                        color: Colors.grey[200],
                      )
                    : Container(),
              ],
            ),
          ),
        );
      });
}
