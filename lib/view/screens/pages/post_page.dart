import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snap/utils/constants.dart';
import 'package:snap/view/components/button_with_icon.dart';
import 'package:snap/view/screens/post_upload_screen.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 95.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ButtonWithIcon(
              iconData: FontAwesomeIcons.images,
              label: "アルバム",
              onPressed: () =>_openPostUploadScreen(UploadType.GALLERY, context),
            ),
            SizedBox(
              height: 24.0,
            ),
            ButtonWithIcon(
              iconData: FontAwesomeIcons.camera,
              label: "写真",
              onPressed: () =>_openPostUploadScreen(UploadType.CAMERA, context),
            ),
          ],
        ),
      ),
    );
  }

  _openPostUploadScreen(UploadType uploadType, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PostUploadScreen(
          uploadType: uploadType,
        ),
      ),
    );
  }
}
