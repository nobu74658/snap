import 'package:flutter/material.dart';
import 'package:snap/data_models/post.dart';
import 'package:snap/view/components/artwork_container.dart';
import 'package:snap/view/components/artwork_desc.dart';
import 'package:snap/view/components/comments_container.dart';
import 'package:snap/view/components/speech_bubbles.dart';
import 'package:snap/view_models/comment_view_model.dart';
import 'package:provider/provider.dart';

class WorksExhibited extends StatelessWidget {
  final Post post;

  const WorksExhibited({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ArtworkContainer(post: post,),
        CommentsContainer(),
        Positioned(
          right: 8,
            bottom: 8,
            child: FloatingActionButton(
              onPressed: () => _postComment(context),
              child: Icon(Icons.comment),
            ))
      ],
    );
  }

  _postComment(BuildContext context) {
  //  TODO _postComments
    print("WorkExhibited#_postComment");
    final commentViewModel = context.read<CommentViewModel>();
  }
}
