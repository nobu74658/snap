import 'package:flutter/material.dart';
import 'package:snap/data_models/post.dart';
import 'package:snap/view/components/artwork_desc.dart';
import 'package:snap/view/components/artwork_image.dart';

class ArtworkContainer extends StatelessWidget {
  final Post post;
  const ArtworkContainer({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ArtworkImage(post: post.imageUrl,),
          ArtworkDesc(post: post,),
        ],
      ),
    );
  }
}
