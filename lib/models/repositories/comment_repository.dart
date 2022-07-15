import 'package:snap/data_models/comment.dart';
import 'package:snap/data_models/user.dart';
import 'package:snap/models/db/database_manager.dart';
import 'package:uuid/uuid.dart';

class CommentRepository {
  final DatabaseManager dbManager;

  CommentRepository({required this.dbManager});

  Future<void> post(User currentUser,String postId, String content) async {
    final comment = Comment(
      commentId: Uuid().v1(),
      userId: currentUser.userId,
      userName: currentUser.displayName,
      postId: postId,
      content: content,
      postDateTime: DateTime.now(),
    );
    await dbManager.insertComment(comment);
  }


}