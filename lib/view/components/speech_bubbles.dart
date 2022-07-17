import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:snap/data_models/comment.dart';
import 'package:snap/data_models/post.dart';

class SpeechBubbles extends StatelessWidget {
  final Comment comment;
  final bool isVisible;
  const SpeechBubbles({Key? key, required this.comment, required this.isVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height/11,
      width: size.width/5,
      child: isVisible ? Bubble(
        borderColor: Colors.black12,
        elevation: 2.0,
        padding: BubbleEdges.symmetric(vertical: 20.0),
        child: Text("Hello World!"),
        radius: Radius.circular(30.0),
        nip: BubbleNip.leftBottom,
        nipOffset: 10.0,
      ) : Container(),
    );
  }
}
