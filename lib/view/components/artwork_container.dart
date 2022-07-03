import 'package:flutter/material.dart';
import 'package:snap/view/components/artwork_desc.dart';
import 'package:snap/view/components/artwork_image.dart';

class ArtworkContainer extends StatelessWidget {
  const ArtworkContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ArtworkImage(),
          ArtworkDesc(),
        ],),
    );
  }
}
