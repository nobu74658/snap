import 'package:flutter/material.dart';

class ArtworkImage extends StatelessWidget {
  final String imageUrl;

  const ArtworkImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ArtWorkImage: $imageUrl}");
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: CircularProgressIndicator(),
        ),
        Center(
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
