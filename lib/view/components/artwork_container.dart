import 'package:flutter/material.dart';
import 'package:snap/data_models/comment.dart';
import 'package:snap/data_models/post.dart';
import 'package:snap/view/components/artwork_desc.dart';
import 'package:snap/view/components/artwork_image.dart';

class ArtworkContainer extends StatelessWidget {
  final Post post;
  final List<Comment> comments;

  const ArtworkContainer({Key? key, required this.post, required this.comments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: comments.length + 3,
      itemBuilder: (BuildContext context, int index) {
        return index == 0
            ? Container(
                height: size.height,
                child: ArtworkImage(imageUrl: post.imageUrl),
              )
            : index == 1
                ? Container(
                    height: 2.0,
                    color: Colors.black,
                  )
                : index == 2
                    ? ArtworkDesc(
                        post: post,
                      )
                    : ListTile(
                        leading: Icon(Icons.comment),
                        title: Text(comments[index - 3].content),
                      );
      },
    );
  }
}
