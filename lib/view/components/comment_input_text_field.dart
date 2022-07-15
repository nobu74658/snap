import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap/styles/style.dart';
import 'package:snap/view_models/comment_view_model.dart';

class CommentInputTextField extends StatefulWidget {
  const CommentInputTextField({Key? key}) : super(key: key);

  @override
  State<CommentInputTextField> createState() => _CommentInputTextFieldState();
}

class _CommentInputTextFieldState extends State<CommentInputTextField> {
  final _commentController = TextEditingController();

  @override
  void initState() {
    _commentController.addListener(_onCommentUpdated);
    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        // color: Colors.white,
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          controller: _commentController,
          style: commentTextStyle,
          autofocus: true,
          decoration: InputDecoration(
            hintText: "コメントを入力...",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  _onCommentUpdated() {
    final commentViewModel = context.read<CommentViewModel>();
    commentViewModel.content = _commentController.text;
    print("content: ${commentViewModel.content}");
  }
}
