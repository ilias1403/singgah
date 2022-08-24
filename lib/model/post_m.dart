// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.postId,
    required this.postTitle,
    required this.postBody,
    required this.author,
    required this.category,
    required this.coverImage,
    required this.image,
    required this.status,
    required this.likes,
    required this.dtAdded,
    required this.dtUpdated,
    required this.authorWithDate,
  });

  String postId;
  String postTitle;
  String postBody;
  String author;
  String category;
  String coverImage;
  dynamic image;
  String status;
  String likes;
  DateTime dtAdded;
  DateTime dtUpdated;
  String authorWithDate;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        postId: json["post_id"],
        postTitle: json["post_title"],
        postBody: json["post_body"],
        author: json["author"],
        category: json["category"],
        coverImage: json["cover_image"],
        image: json["image"],
        status: json["status"],
        likes: json["likes"],
        dtAdded: DateTime.parse(json["dt_added"]),
        dtUpdated: DateTime.parse(json["dt_updated"]),
        authorWithDate: json["author_with_date"],
      );

  Map<String, dynamic> toJson() => {
        "post_id": postId,
        "post_title": postTitle,
        "post_body": postBody,
        "author": author,
        "category": category,
        "cover_image": coverImage,
        "image": image,
        "status": status,
        "likes": likes,
        "dt_added": dtAdded.toIso8601String(),
        "dt_updated": dtUpdated.toIso8601String(),
        "author_with_date": authorWithDate,
      };

  @override
  String toString() {
    return 'Post{postId: $postId, postTitle: $postTitle, postBody: $postBody, author: $author, category: $category, coverImage: $coverImage, image,: $image, status: $status, likes: $likes, dtAdded: $dtAdded, dtUpdated: $dtUpdated, authorWithDate: $authorWithDate}';
  }
}
