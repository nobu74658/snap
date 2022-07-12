import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:snap/data_models/user.dart';
import 'package:snap/models/db/database_manager.dart';
import 'package:snap/utils/constants.dart';
import 'package:uuid/uuid.dart';

class PostRepository {
  final DatabaseManager dbManager;

  PostRepository({required this.dbManager});

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
      final storageId = Uuid().v1();
      final imageUrl = await dbManager.uploadImageToStorage(imageFile, storageId);
      print("storageImageUrl: ${imageUrl}");
  }
}
