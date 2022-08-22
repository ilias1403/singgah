import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daniel/screen/post/add_post.dart';

class Post2 extends StatelessWidget {
  const Post2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Image.network(
          'https://i.pinimg.com/564x/dc/d7/a8/dcd7a85b3ab30d3868c165455962c3f2.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ));
  }
}
