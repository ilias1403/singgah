import 'package:daniel/controller/post.dart';
import 'package:daniel/model/post_m.dart';
import 'package:daniel/widget/recipe_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:daniel/screen/navbar/main_navbar.dart';

import 'package:daniel/screen/post/post1_v.dart';
import 'package:daniel/screen/post/post2_v.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = PageController();
  List<Post>? _posts;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  _getPosts() async {
    _posts = await PostController().getQuoteList();
    // print("Log : $_posts");
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              decoration: BoxDecoration(
                  // image: DecorationImage(image: AssetImage('Assets/night.jpg')),
                  ),
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
                        return RecipeCard(
                          title: _posts![index].quote,
                          cookTime: _posts![index].author,
                          rating: '3.0',
                          thumbnailUrl: _posts![index].image,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class getPosting {}
