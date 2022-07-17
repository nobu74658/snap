import 'package:flutter/material.dart';

class Post {
  String postId;
  String userId;
  String imageUrl;
  String imageStoragePath;
  String caption;
  String title;
  String author;
  DateTime postDateTime;
  List<dynamic> commentIsVisible;

//<editor-fold desc="Data Methods">

  Post({
    required this.postId,
    required this.userId,
    required this.imageUrl,
    required this.imageStoragePath,
    required this.caption,
    required this.title,
    required this.author,
    required this.postDateTime,
    required this.commentIsVisible,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Post &&
          runtimeType == other.runtimeType &&
          postId == other.postId &&
          userId == other.userId &&
          imageUrl == other.imageUrl &&
          imageStoragePath == other.imageStoragePath &&
          caption == other.caption &&
          title == other.title &&
          author == other.author &&
          postDateTime == other.postDateTime &&
          commentIsVisible == other.commentIsVisible);

  @override
  int get hashCode =>
      postId.hashCode ^
      userId.hashCode ^
      imageUrl.hashCode ^
      imageStoragePath.hashCode ^
      caption.hashCode ^
      title.hashCode ^
      author.hashCode ^
      postDateTime.hashCode ^
      commentIsVisible.hashCode;

  @override
  String toString() {
    return 'Post{' +
        ' postId: $postId,' +
        ' userId: $userId,' +
        ' imageUrl: $imageUrl,' +
        ' imageStoragePath: $imageStoragePath,' +
        ' caption: $caption,' +
        ' title: $title,' +
        ' author: $author,' +
        ' postDateTime: $postDateTime,' +
        ' commentIsVisible: $commentIsVisible,' +
        '}';
  }

  Post copyWith({
    String? postId,
    String? userId,
    String? imageUrl,
    String? imageStoragePath,
    String? caption,
    String? title,
    String? author,
    DateTime? postDateTime,
    List<dynamic>? commentIsVisible,
  }) {
    return Post(
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      imageUrl: imageUrl ?? this.imageUrl,
      imageStoragePath: imageStoragePath ?? this.imageStoragePath,
      caption: caption ?? this.caption,
      title: title ?? this.title,
      author: author ?? this.author,
      postDateTime: postDateTime ?? this.postDateTime,
      commentIsVisible: commentIsVisible ?? this.commentIsVisible,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': this.postId,
      'userId': this.userId,
      'imageUrl': this.imageUrl,
      'imageStoragePath': this.imageStoragePath,
      'caption': this.caption,
      'title': this.title,
      'author': this.author,
      'postDateTime': this.postDateTime.toIso8601String(),
      'commentIsVisible': this.commentIsVisible,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      postId: map['postId'] as String,
      userId: map['userId'] as String,
      imageUrl: map['imageUrl'] as String,
      imageStoragePath: map['imageStoragePath'] as String,
      caption: map['caption'] as String,
      title: map['title'] as String,
      author: map['author'] as String,
      postDateTime: DateTime.parse(map['postDateTime'] as String),
      commentIsVisible: map['commentIsVisible'] as List<dynamic>,
    );
  }

//</editor-fold>
}