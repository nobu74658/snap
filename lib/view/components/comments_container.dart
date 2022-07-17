import 'package:flutter/material.dart';
import 'package:snap/view/components/speech_bubbles.dart';

class CommentsContainer extends StatelessWidget {
  const CommentsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SpeechBubbles(),
              SpeechBubbles(),
              SpeechBubbles(),
            ],
          ),
          Row(
            children: [
              SpeechBubbles(),
              SpeechBubbles(),
              SpeechBubbles(),
            ],
          ),
          Row(
            children: [
              SpeechBubbles(),
              SpeechBubbles(),
              SpeechBubbles(),
            ],
          ),
          Row(
            children: [
              SpeechBubbles(),
              SpeechBubbles(),
              SpeechBubbles(),
            ],
          ),
          Row(
            children: [
              SpeechBubbles(),
              SpeechBubbles(),
              SpeechBubbles(),
            ],
          ),
        ],
      ),
    );
  }
}
