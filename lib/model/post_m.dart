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
    required this.quoteId,
    required this.quote,
    required this.author,
    required this.image,
    required this.status,
    required this.dtAdded,
    required this.dtUpdated,
  });

  String quoteId;
  String quote;
  String author;
  String image;
  String status;
  DateTime dtAdded;
  DateTime dtUpdated;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        quoteId: json["quote_id"],
        quote: json["quote"],
        author: json["author"],
        image: json["image"],
        status: json["status"],
        dtAdded: DateTime.parse(json["dt_added"]),
        dtUpdated: DateTime.parse(json["dt_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "quote_id": quoteId,
        "quote": quote,
        "author": author,
        "image": image,
        "status": status,
        "dt_added": dtAdded.toIso8601String(),
        "dt_updated": dtUpdated.toIso8601String(),
      };

  @override
  String toString() {
    return 'Post{quoteId: $quoteId, quote: $quote, author: $author, image: $image, status: $status, dtAdded: $dtAdded, dtUpdated: $dtUpdated}';
  }
}
