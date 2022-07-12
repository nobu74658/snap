import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class SpeechBubbles extends StatelessWidget {
  const SpeechBubbles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Bubble(child: Text("Hello World!"), radius: Radius.circular(30.0),),
    );
  }
}