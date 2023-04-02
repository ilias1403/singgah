import 'package:daniel/controller/notify.dart';
import 'package:daniel/controller/post.dart';
import 'package:daniel/model/notify_m.dart';
import 'package:daniel/model/post_m.dart';
import 'package:daniel/widget/singgah_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daniel/screen/navbar/main_navbar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Post>? _posts;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  Future<void> _getPosts() async {
    _posts = await PostController().getQuoteList();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var default_bg = Colors.greenAccent;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const NavBar(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: const Text('~𝙨𝙞𝙣𝙜𝙜𝙖𝙝~'),
        actions: [
          IconButton(
              onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
              icon: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/9e/8a/88/9e8a88e1ea1fa25810134f8d4d269a5d.jpg',
                ),
                backgroundColor: Colors.greenAccent,
                radius: 120,
              )),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: _getPosts,
        child: _isLoading
            ? Center(
                child: SpinKitSquareCircle(
                color: Colors.purple,
                size: 50.0,
              ))
            : Container(
                decoration: BoxDecoration(
                    // image: DecorationImage(image: AssetImage('Assets/night.jpg')),
                    color: default_bg),
                child: Column(
                  children: [
                    Container(
                        // height: constraints.maxHeight * 0.175,
                        ),
                    Expanded(
                      child: PageView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _posts?.length ?? 0,
                        itemBuilder: (context, index) {
                          return SinggahCard(
                            post_id: _posts![index].postId,
                            post_title: _posts![index].postTitle,
                            post_body: _posts![index].postBody,
                            category: _posts![index].category,
                            cover_image: _posts![index].coverImage,
                            likes: _posts![index].likes,
                            auhor_with_date: _posts![index].authorWithDate,
                          );
                        },
                      ),
                    ),
                    // StreamBuilder(
                    //   stream: getPrice(),
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData) {
                    //       print(snapshot.data);
                    //     } else if (snapshot.hasError) {
                    //       return Text(
                    //         '${snapshot.error}',
                    //         style: TextStyle(
                    //             fontSize: 20,
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.white),
                    //       );
                    //     }
                    //     return Text('Test');
                    //   },
                    // )
                  ],
                ),
              ),
      ),
    );
  }
}

Widget btn3(BuildContext context) {
  return MaterialButton(
    minWidth: 300,
    color: Colors.grey[300],
    onPressed: () => Dialogs.materialDialog(
      color: Colors.white,
      msg: 'Congratulations, you won 500 points',
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
          textStyle: TextStyle(color: Colors.white),
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
    child: Text("Show animations Material Dialog"),
  );
}
