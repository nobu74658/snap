import 'package:flutter/material.dart';
import 'package:snap/models/repositories/comment_repository.dart';
import 'package:snap/models/repositories/post_repository.dart';
import 'package:snap/models/repositories/user_repository.dart';

class CommentViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final PostRepository postRepository;
  final CommentRepository commentRepository;

  CommentViewModel(
      {required this.userRepository,
      required this.postRepository,
      required this.commentRepository});

  String content = "";

  bool isProcessing = false;

  Future<void> cancelPost() async {
    isProcessing = false;
    notifyListeners();
  }

  Future<void> post(String postId) async {
    isProcessing = true;
    notifyListeners();

    await commentRepository.post(
      UserRepository.currentUser!,
      postId,
      content,
    );

    isProcessing = false;
    notifyListeners();
  }
}
