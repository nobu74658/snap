import 'package:flutter/material.dart';
import 'package:snap/view/components/artwork_desc.dart';

class ArtworkContainer extends StatelessWidget {
  const ArtworkContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //TODO ArtworkImage
          // ArtworkImage(),
          ArtworkDesc(),
        ],),
    );
  }
}
