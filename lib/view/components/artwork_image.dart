import 'package:flutter/material.dart';

class ArtworkImage extends StatelessWidget {
  const ArtworkImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(image: AssetImage('assets/images/no_image.jpg',),width: 140.0,height: 140.0, fit: BoxFit.cover,),
    );
  }
}
