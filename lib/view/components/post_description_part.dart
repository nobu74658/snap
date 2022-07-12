import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/post_view_model.dart';

class PostDescriptionPart extends StatefulWidget {
  const PostDescriptionPart({Key? key}) : super(key: key);

  @override
  State<PostDescriptionPart> createState() => _PostDescriptionPartState();
}

class _PostDescriptionPartState extends State<PostDescriptionPart> {

  final _titleController = TextEditingController();
  final _authorController = TextEditingController();

  @override
  void initState() {
    _titleController.addListener(() {
      _onTitleUpdated();
    });
    _authorController.addListener(() {
      _onAuthorUpdated();
    });
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              icon: Icon(Icons.title),
              hintText: "タイトルを入力してください",
              labelText: "タイトル",
            ),
          ),
          TextField(
            controller: _authorController,
            decoration: InputDecoration(
              icon: Icon(Icons.face),
              hintText: "作者名を入力してください",
              labelText: "作者名",
            ),
          )
        ],
      ),
    );
  }

  void _onTitleUpdated() {
    final viewModel = context.read<PostViewModel>();
    viewModel.title = _titleController.text;
    print("title: ${viewModel.title}");
  }

  void _onAuthorUpdated() {
    final viewModel = context.read<PostViewModel>();
    viewModel.author = _authorController.text;
    print("author: ${viewModel.author}");
  }
}
