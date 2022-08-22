import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daniel/screen/post/add_post.dart';

class Post1 extends StatelessWidget {
  const Post1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Image.network(
          'https://i.pinimg.com/564x/d4/c7/e1/d4c7e119941d208bcea2ba6b0d165f09.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ));
  }
}
