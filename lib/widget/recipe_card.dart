import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(thumbnailUrl), fit: BoxFit.cover)),
          child: buildQuoteCard(),
        ));
  }

  Widget buildQuoteCard() => Center(
        child: SizedBox(
            width: 360,
            height: 460,
            child: Card(
              color: Color.fromRGBO(44, 54, 57, 0.8),
              shadowColor: Colors.black,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      cookTime,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Divider(
                      height: 26,
                      thickness: 6,
                      color: Colors.white,
                      indent: 120,
                      endIndent: 120,
                    ),
                    const SizedBox(height: 50),
                    Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 180),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        Wrap(
                          alignment: WrapAlignment.start,
                          spacing: 20, // space between two icons
                          children: [
                            Container(
                                child: Icon(Icons.comment_outlined,
                                    color: Colors.white)),
                            Container(
                              child: Icon(Icons.favorite_border_outlined,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    )
                    // Wrap(
                    //   alignment: WrapAlignment.start,
                    //   spacing: 20, // space between two icons
                    //   children: [
                    //     Container(
                    //         child: Icon(Icons.comment_outlined,
                    //             color: Colors.white)),
                    //     Container(
                    //       child: Icon(Icons.favorite_border_outlined,
                    //           color: Colors.white),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            )),
      );
}
