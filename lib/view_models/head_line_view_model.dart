import 'package:flutter/material.dart';
import 'package:snap/data_models/post.dart';
import 'package:snap/data_models/user.dart';
import 'package:snap/models/repositories/post_repository.dart';
import 'package:snap/models/repositories/user_repository.dart';
import 'package:snap/utils/constants.dart';

class HeadLineViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final PostRepository postRepository;

  HeadLineViewModel({required this.userRepository, required this.postRepository});

  bool isProcessing = false;
  List<Post> posts = [];

  void setFeedUser(FeedMode feedMode, User user) {

  }

  Future<void> getPosts(FeedMode feedMode) async {
    isProcessing = true;
    notifyListeners();

    posts = await postRepository.getPosts(feedMode);

    isProcessing = false;
    notifyListeners();
  }
}