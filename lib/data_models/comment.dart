class Comment {
  String commentId;
  String userId;
  String postId;
  String content;
  String userName;
  DateTime postDateTime;

//<editor-fold desc="Data Methods">

  Comment({
    required this.commentId,
    required this.userId,
    required this.postId,
    required this.content,
    required this.userName,
    required this.postDateTime,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comment &&
          runtimeType == other.runtimeType &&
          commentId == other.commentId &&
          userId == other.userId &&
          postId == other.postId &&
          content == other.content &&
          userName == other.userName &&
          postDateTime == other.postDateTime);

  @override
  int get hashCode =>
      commentId.hashCode ^
      userId.hashCode ^
      postId.hashCode ^
      content.hashCode ^
      userName.hashCode ^
      postDateTime.hashCode;

  @override
  String toString() {
    return 'Comment{' +
        ' commentId: $commentId,' +
        ' userId: $userId,' +
        ' postId: $postId,' +
        ' content: $content,' +
        ' userName: $userName,' +
        ' postDateTime: $postDateTime,' +
        '}';
  }

  Comment copyWith({
    String? commentId,
    String? userId,
    String? postId,
    String? content,
    String? userName,
    DateTime? postDateTime,
  }) {
    return Comment(
      commentId: commentId ?? this.commentId,
      userId: userId ?? this.userId,
      postId: postId ?? this.postId,
      content: content ?? this.content,
      userName: userName ?? this.userName,
      postDateTime: postDateTime ?? this.postDateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'commentId': this.commentId,
      'userId': this.userId,
      'postId': this.postId,
      'content': this.content,
      'userName': this.userName,
      'postDateTime': this.postDateTime.toIso8601String(),
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      commentId: map['commentId'] as String,
      userId: map['userId'] as String,
      postId: map['postId'] as String,
      content: map['content'] as String,
      userName: map['userName'] as String,
      postDateTime: DateTime.parse(map['postDateTime'] as String),
    );
  }

//</editor-fold>
}