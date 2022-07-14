import 'package:flutter/material.dart';
import 'package:snap/data_models/post.dart';
import 'package:snap/view/components/artwork_container.dart';
import 'package:snap/view/components/artwork_desc.dart';
import 'package:snap/view/components/speech_bubbles.dart';

class WorksExhibited extends StatelessWidget {
  final Post post;

  const WorksExhibited({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ArtworkContainer(post: post,),
        SpeechBubbles(),
      ],
    );
  }
}
