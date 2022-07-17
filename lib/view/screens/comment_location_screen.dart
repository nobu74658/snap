import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap/view/components/artwork_container.dart';
import 'package:snap/view/components/comments_container.dart';
import 'package:snap/view/components/hero_image.dart';
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Comments Location"),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () => _confirmCommentsLocation(context),
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Center(child: HeroImage(image: image)),
            // CommentsContainer(),
          ],
        ),
      ),
    );
  }

  void _confirmCommentsLocation(BuildContext context) async {
    final postViewModel = context.read<PostViewModel>();
    // await postViewModel.commentsLocation();
    print("#_confirmCommentsLocation");
    Navigator.pop(context);
  }
}
