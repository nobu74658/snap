import 'package:flutter/material.dart';
import 'package:snap/data_models/post.dart';

class ArtworkDesc extends StatelessWidget {
  final Post post;

  const ArtworkDesc({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              post.title,
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              post.author,
              style: TextStyle(fontSize: 20),
            ),
            Container(
              width: 200,
              child: Text(
                post.caption,
                softWrap: true,
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
