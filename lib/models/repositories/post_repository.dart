import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:snap/data_models/user.dart';
import 'package:snap/utils/constants.dart';

class PostRepository {
  Future<File?> pickImage(UploadType uploadType) async {
    final imagePicker = ImagePicker();

    if (uploadType == UploadType.GALLERY) {
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      return (pickedImage != null) ? File(pickedImage.path) : null;
    } else {
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.camera);
      return (pickedImage != null) ? File(pickedImage.path) : null;
    }
  }

  Future<void> post(User currentUser, File imageFile, String caption, String title, String author) async{

  }
}
