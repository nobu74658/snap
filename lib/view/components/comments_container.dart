import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap/data_models/comment.dart';
import 'package:snap/data_models/post.dart';
import 'package:snap/view/components/speech_bubbles.dart';
import 'package:snap/view_models/post_view_model.dart';

class CommentsContainer extends StatelessWidget {
  final List<Comment> comments;
  final List<bool> commentIsVisible;
  const CommentsContainer({Key? key, required this.comments, required this.commentIsVisible}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SpeechBubbles(comment: comments[0],isVisible: commentIsVisible[0],),
                SpeechBubbles(comment: comments[1],isVisible: commentIsVisible[1],),
                SpeechBubbles(comment: comments[2],isVisible: commentIsVisible[2],),
                SpeechBubbles(comment: comments[3],isVisible: commentIsVisible[3],),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SpeechBubbles(comment: comments[3],isVisible: commentIsVisible[4],),
                SpeechBubbles(comment: comments[2],isVisible: commentIsVisible[5],),
                SpeechBubbles(comment: comments[1],isVisible: commentIsVisible[6],),
                SpeechBubbles(comment: comments[0],isVisible: commentIsVisible[7],),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     SpeechBubbles(isVisible: false,),
            //     SpeechBubbles(isVisible: true,),
            //     SpeechBubbles(isVisible: false,),
            //     SpeechBubbles(isVisible: true,),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     SpeechBubbles(isVisible: false,),
            //     SpeechBubbles(isVisible: false,),
            //     SpeechBubbles(isVisible: true,),
            //     SpeechBubbles(isVisible: true,),],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [SpeechBubbles(isVisible: false,),
            //     SpeechBubbles(isVisible: true,),
            //     SpeechBubbles(isVisible: false,),
            //     SpeechBubbles(isVisible: true,),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [SpeechBubbles(isVisible: true,),
            //     SpeechBubbles(isVisible: true,),
            //     SpeechBubbles(isVisible: true,),
            //     SpeechBubbles(isVisible: true,),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [SpeechBubbles(isVisible: true,),
            //     SpeechBubbles(isVisible: false,),
            //     SpeechBubbles(isVisible: true,),
            //     SpeechBubbles(isVisible: true,),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [SpeechBubbles(isVisible: false,),
            //     SpeechBubbles(isVisible: true,),
            //     SpeechBubbles(isVisible: false,),
            //     SpeechBubbles(isVisible: true,),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [SpeechBubbles(isVisible: false,),
            //     SpeechBubbles(isVisible: true,),
            //     SpeechBubbles(isVisible: false,),
            //     SpeechBubbles(isVisible: true,),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
