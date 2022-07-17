import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap/data_models/post.dart';
import 'package:snap/view/components/artwork_container.dart';
import 'package:snap/view/components/artwork_desc.dart';
import 'package:snap/view/components/comments_container.dart';
import 'package:snap/view/components/speech_bubbles.dart';
import 'package:snap/view/screens/comment_upload_screen.dart';
import 'package:snap/view_models/comment_view_model.dart';

class WorksExhibited extends StatelessWidget {
  final Post post;

  const WorksExhibited({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commentViewModel = context.read<CommentViewModel>();

    Future(() => commentViewModel.getComments(post.postId));

    return Consumer<CommentViewModel>(
      builder: (context, model, child) {
        return model.isProcessing
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  ArtworkContainer(
                    post: post,
                    comments: commentViewModel.comments,
                  ),
                  Positioned(
                      right: 8,
                      bottom: 8,
                      child: FloatingActionButton(
                        onPressed: () => _postComment(context),
                        child: Icon(Icons.comment),
                      ),),
                ],
              );
      },
    );
  }

  void _postComment(BuildContext context) {
    //  TODO _postComments
    print("WorkExhibited#_postComment");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CommentUploadScreen(post: post)),
    );
    // final commentViewModel = context.read<CommentViewModel>();
    // await commentViewModel.post();
  }
}
