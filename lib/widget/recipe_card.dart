import 'package:flutter/material.dart';

class RecipeCard extends StatefulWidget {
  final String title;
  final String rating;
  final String cookTime;
  final String thumbnailUrl;
  RecipeCard({
    required this.title,
    required this.cookTime,
    required this.rating,
    required this.thumbnailUrl,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  Color _iconColor1 = Colors.white;
  var iconLiked1 = Icons.favorite_border;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.thumbnailUrl), fit: BoxFit.cover)),
          child: Center(
            /** Card Widget **/

            child: Container(
              padding: EdgeInsets.only(top: 270),
              child: Card(
                elevation: 50,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                color: Color.fromRGBO(9, 9, 9, 0.8),
                child: SizedBox(
                  width: 360,
                  height: 360,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          widget.cookTime,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ), //Textstyle
                        ), //Text
                        Divider(
                          color: Colors.white,
                          height: 50,
                          thickness: 5,
                          indent: 120,
                          endIndent: 120,
                        ),
                        const SizedBox(
                          height: 10,
                        ), //SizedBox
                        Text(
                          widget.title,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(iconLiked1),
                                      iconSize: 20.0,
                                      color: _iconColor1,
                                      onPressed: () {
                                        setState(() {
                                          if (_iconColor1 == Colors.white) {
                                            _iconColor1 = Colors.red;
                                            iconLiked1 = Icons.favorite;
                                          } else {
                                            _iconColor1 = Colors.white;
                                            iconLiked1 = Icons.favorite_border;
                                          }
                                          // _iconColor1 = Colors.red;
                                        });
                                      },
                                    ),
                                    Text(
                                      '126',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.chat_bubble_outline),
                                      iconSize: 20.0,
                                      color: Colors.white,
                                      onPressed: () => print('Like post'),
                                    ),
                                    Text(
                                      '126',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 36),
                                      child: IconButton(
                                        icon: Icon(Icons.favorite_border),
                                        iconSize: 0.001,
                                        color: Colors.white,
                                        onPressed: () => print('Like post'),
                                      ),
                                    ),
                                    Text(
                                      '22 Aug,2022.Ilias',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Padding(
                      ],
                    ), //Column
                  ), //Padding
                ), //SizedBox
              ),
            ), //Card
          ), //Center,
        ));
  }
}

void getChangeIcon() {}
