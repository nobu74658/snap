import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap/utils/constants.dart';
import 'package:snap/view/components/artwork_container.dart';
import 'package:snap/view/components/speech_bubbles.dart';
import 'package:snap/view/components/works_exhibited.dart';
import 'package:snap/view_models/head_line_view_model.dart';

class HeadLinePage extends StatelessWidget {
  final FeedMode feedMode;

  const HeadLinePage({Key? key, required this.feedMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headLineViewModel = context.read<HeadLineViewModel>();

    Future(() => headLineViewModel.getPosts(feedMode));

    return Consumer<HeadLineViewModel>(
      builder: (context, model, child){
        if(model.isProcessing){
          return Center(child: CircularProgressIndicator(),);
        } else {
          print("posts!!! ${model.posts.length}");
          return PageView.builder(
              itemCount: model.posts.length,
              itemBuilder: (context, index){
                return WorksExhibited(post: model.posts[index],);
              });
        }
      },
      // child: Stack(
      //     children: [
      //       SpeechBubbles(),
      //       ArtworkContainer(),
      //     ],
      // ),
    );
  }
}
