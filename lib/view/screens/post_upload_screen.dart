import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap/utils/constants.dart';
import 'package:snap/view/components/confirm_dialog.dart';
import 'package:snap/view_models/post_view_model.dart';

import '../components/post_caption_part.dart';
import '../components/post_description_part.dart';

class PostUploadScreen extends StatelessWidget {
  final UploadType uploadType;

  const PostUploadScreen({Key? key, required this.uploadType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postViewModel = context.read<PostViewModel>();

    if (!postViewModel.isImagePicked && !postViewModel.isProcessing) {
      Future(() => postViewModel.pickImage(uploadType));
    }

    return Consumer<PostViewModel>(
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              leading: model.isProcessing
                  ? Container()
                  : IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => _cancelPost(context),
                    ),
              title: model.isProcessing ? Text("処理中") : Text("投稿"),
              actions: [
                (model.isProcessing || !model.isImagePicked)
                    ? IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => _cancelPost(context),
                      )
                    : IconButton(
                        icon: Icon(Icons.done),
                        //ダイアログを出して投稿処理
                        onPressed: () => showConfirmDialog(
                          context: context,
                          title: "投稿",
                          content: "投稿しますか？",
                          onConfirmed: (isConfirmed) {
                            if (isConfirmed) {
                              _post(context);
                            }
                          },
                        ),
                      )
              ],
            ),
            body: model.isProcessing
                ? Center(child: CircularProgressIndicator())
                : model.isImagePicked
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Divider(),
                            PostCaptionPart(
                              from: PostCaptionOpenMode.FROM_POST,
                            ),
                            Divider(),
                            PostDescriptionPart(),
                            Divider(),
                          ],
                        ),
                      )
                    : Container());
      },
    );
  }

  _cancelPost(BuildContext context) async {
    final postViewModel = context.read<PostViewModel>();
    await postViewModel.cancelPost();
    print("PostUploadScreen#_cancelPost");
    Navigator.pop(context);
  }

  void _post(BuildContext context) async {
    print("PostUploadScreen#_post");
    final postViewModel = context.read<PostViewModel>();
    await postViewModel.post();
    Navigator.pop(context);
  }
}
