import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap/view/components/artwork_container.dart';
import 'package:snap/view_models/post_view_model.dart';

class CommentLocationScreen extends StatelessWidget {
  const CommentLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postViewModel = context.watch<PostViewModel>();
    final image = (postViewModel.imageFile != null)
        ? Image.file(postViewModel.imageFile!)
        : Image.asset("assets/images/no_image.jpg");

    return Scaffold(
        body: Container(child: Image.network(image.toString()),
    ),);
  }
}
