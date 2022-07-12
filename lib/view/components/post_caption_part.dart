import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap/utils/constants.dart';
import 'package:snap/view/components/hero_image.dart';
import 'package:snap/view/components/post_caption_input_text_field.dart';
import 'package:snap/view/screens/enlarge_screen.dart';
import 'package:snap/view_models/post_view_model.dart';

class PostCaptionPart extends StatelessWidget {
  final PostCaptionOpenMode from;

  const PostCaptionPart({Key? key, required this.from}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postViewModel = context.watch<PostViewModel>();
    final image = (postViewModel.imageFile != null)
        ? Image.file(postViewModel.imageFile!)
        : Image.asset("assets/images/no_image.jpg");

    if (from == PostCaptionOpenMode.FROM_POST) {
      return ListTile(
        leading: HeroImage(
          image: image,
          onTap: () => _displayLargeImage(context, image)
        ),
        title: PostCaptionInputTextField(),
      );
    } else {
      return Container();
    }
  }

  _displayLargeImage(BuildContext context, Image image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EnlargeImageScreen(image: image),
      ),
    );
  }
}
