import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class SinggahCard extends StatefulWidget {
  final String post_id;
  final String post_title;
  final String post_body;
  final String category;
  final String cover_image;
  final String likes;
  final String auhor_with_date;
  SinggahCard({
    required this.post_id,
    required this.post_title,
    required this.post_body,
    required this.category,
    required this.cover_image,
    required this.likes,
    required this.auhor_with_date,
  });

  @override
  State<SinggahCard> createState() => _SinggahCardState();
}

class _SinggahCardState extends State<SinggahCard> {
  Color _iconColor1 = Colors.white;
  var iconLiked1 = Icons.favorite_border;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.cover_image), fit: BoxFit.cover)),
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
                  height: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          widget.post_title,
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
                          widget.post_body,
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
                                      widget.likes,
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
                                      onPressed: () => Dialogs.materialDialog(
                                        color: Colors.white,
                                        msg:
                                            'Congratulations, you won 500 points',
                                        title: 'Congratulations',
                                        lottieBuilder: Lottie.network(
                                          'https://assets9.lottiefiles.com/packages/lf20_cn1bp1vk.json',
                                          fit: BoxFit.contain,
                                        ),
                                        dialogWidth: kIsWeb ? 0.3 : null,
                                        context: context,
                                        actions: [
                                          IconsButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            text: 'Okay!',
                                            iconData: Icons.done,
                                            color: Colors.green,
                                            textStyle:
                                                TextStyle(color: Colors.white),
                                            iconColor: Colors.white,
                                          ),
                                          // IconsButton(
                                          //   onPressed: () {
                                          //     Navigator.of(context).pop();
                                          //   },
                                          //   text: 'Claim',
                                          //   iconData: Icons.done,
                                          //   color: Colors.blue,
                                          //   textStyle: TextStyle(color: Colors.white),
                                          //   iconColor: Colors.white,
                                          // ),
                                        ],
                                      ),
                                    ),
                                    // Text(
                                    //   '126',
                                    //   style: TextStyle(
                                    //     fontSize: 12.0,
                                    //     fontWeight: FontWeight.w600,
                                    //     color: Colors.white,
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 32),
                                      child: IconButton(
                                        icon: Icon(Icons.favorite_border),
                                        iconSize: 0.001,
                                        color: Colors.white,
                                        onPressed: () => print('Like post'),
                                      ),
                                    ),
                                    Text(
                                      widget.auhor_with_date,
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

                        Row(
                          children: [
                            Flexible(
                                flex: 15,
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Row(
                                    children: [
                                      Text(
                                        'Category: ${widget.category}',
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

void getChangeIcon() {}
