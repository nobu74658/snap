import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';

class SpeechBubbles extends StatelessWidget {
  const SpeechBubbles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // alignment: Alignment.center,
        height: 60,
        child: Bubble(
          borderColor: Colors.black12,
          elevation: 2.0,
          padding: BubbleEdges.symmetric(vertical: 20.0),
          child: Text("Hello World!"),
          radius: Radius.circular(30.0),
          nip: BubbleNip.leftBottom,
          nipOffset: 10.0,
        ),
      ),
    );
  }
}
