import 'package:flutter/material.dart';

class ArtworkDesc extends StatelessWidget {
  const ArtworkDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("Title",style: TextStyle(fontSize: 24.0),),
            Text("Author", style: TextStyle(fontSize: 20),),
            Text("ここには作品の説明が入ります。ここには作品の説明が入ります",style: TextStyle(fontSize: 14.0),),
          ],
        ),
      ),
    );
  }
}
