import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap/data_models/post.dart';
import 'package:snap/view/components/artwork_container.dart';
import 'package:snap/view/components/comment_input_text_field.dart';
import 'package:snap/view/components/comments_container.dart';
import 'package:snap/view/components/confirm_dialog.dart';
import 'package:snap/view_models/comment_view_model.dart';

class CommentUploadScreen extends StatelessWidget {

  final Post post;

  const CommentUploadScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CommentViewModel>(builder: (context, model, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: model.isProcessing
              ? Container()
              : IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => _cancelPost(context),
                ),
          title: model.isProcessing ? Text("処理中") : Text("投稿"),
          actions: [
            model.isProcessing
                ? IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => _cancelPost(context),
                  )
                : IconButton(
                    icon: Icon(
                      Icons.done,
                    ),
                    onPressed: () => showConfirmDialog(
                        context: context,
                        title: "投稿",
                        content: "投稿しますか？",
                        onConfirmed: (isConfirmed){
                          if (isConfirmed) {
                            _post(context, post.postId);
                          }
                        }),
                  )
          ],
        ),
        body: model.isProcessing ? Center(child: CircularProgressIndicator() ):
        Stack(
          alignment: Alignment.center,
          children: [
            ArtworkContainer(post: post,),
            CommentsContainer(),
            Container(color: Colors.black45,),
            CommentInputTextField(),
          ],
        ),
      );
    });
  }

  //TODO _cancelPost
  void _cancelPost(BuildContext context) async {
    final commentViewModel = context.read<CommentViewModel>();
    await commentViewModel.cancelPost();
    print("CommentUploadScreen#_cancelPost");
    Navigator.pop(context);
  }

  void _post(BuildContext context, String postId) async {
    print("CommentUploadScreen#_post");
    final commentViewModel = context.read<CommentViewModel>();
    await commentViewModel.post(postId);
    Navigator.pop(context);
  }
}
