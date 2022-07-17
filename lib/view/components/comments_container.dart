import 'package:flutter/material.dart';
import 'package:snap/view/components/speech_bubbles.dart';

class CommentsContainer extends StatelessWidget {
  const CommentsContainer({Key? key}) : super(key: key);

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
                SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: true,),
                SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: true,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: true,),
                SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: true,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: true,),
                SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: true,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: true,),
                SpeechBubbles(isVisible: true,),],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: true,),
                SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: true,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [SpeechBubbles(isVisible: true,),
                SpeechBubbles(isVisible: true,),
                SpeechBubbles(isVisible: true,),
                SpeechBubbles(isVisible: true,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [SpeechBubbles(isVisible: true,),
                SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: true,),
                SpeechBubbles(isVisible: true,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: true,),
                SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: true,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: true,),
                SpeechBubbles(isVisible: false,),
                SpeechBubbles(isVisible: true,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
