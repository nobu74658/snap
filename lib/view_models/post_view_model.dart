import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snap/models/repositories/post_repository.dart';
import 'package:snap/models/repositories/user_repository.dart';
import 'package:snap/utils/constants.dart';

class PostViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final PostRepository postRepository;

  PostViewModel({required this.userRepository, required this.postRepository});

  File? imageFile;

  String caption = "";

  String title = "";
  String author = "";

  bool isProcessing = false;
  bool isImagePicked = false;

  Future<void> pickImage(UploadType uploadType) async{
    isImagePicked = false;
    isProcessing = true;
    notifyListeners();

    imageFile = await postRepository.pickImage(uploadType);

    print("pickedImage: ${imageFile?.path}");
    if(imageFile != null) isImagePicked = true;
    isProcessing = false;
    notifyListeners();
  }

  Future<void> post() async{

    if(imageFile == null) return;

    isProcessing = true;
    notifyListeners();

    await postRepository.post(
      UserRepository.currentUser!,
      imageFile!,
      caption,
      title,
      author,
    );

    isProcessing = false;
    isImagePicked = false;
    notifyListeners();
  }

  Future<void> cancelPost() async{
    isProcessing = false;
    isImagePicked = false;
    notifyListeners();
  }
}
