import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:snap/data_models/comment.dart';
import 'package:snap/data_models/post.dart';
import 'package:snap/data_models/user.dart';

class DatabaseManager {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> searchUserInDb(auth.User firebaseUser) async {
    final query = await _db
        .collection("users")
        .where("userId", isEqualTo: firebaseUser.uid)
        .get();
    if (query.docs.length > 0) {
      return true;
    }
    return false;
  }

  Future<void> insertUser(User user) async {
    _db.collection("users").doc(user.userId).set(user.toMap());
  }

  Future<User> getUserInfoFromDbById(String userId) async {
    final query =
        await _db.collection("users").where("userId", isEqualTo: userId).get();
    return User.fromMap(query.docs[0].data());
  }

  Future<String> uploadImageToStorage(File imageFile, String storageId) async {
    final storageRef = FirebaseStorage.instance.ref().child(storageId);
    final uploadTask = storageRef.putFile(imageFile);
    return uploadTask
        .then((TaskSnapshot snapshot) => snapshot.ref.getDownloadURL());
  }

  Future<void> insertPost(Post post) async {
    await _db.collection("posts").doc(post.postId).set(post.toMap());
  }

  Future<List<Post>> getPosts() async {
    final query = await _db.collection("posts").get();
    if (query.docs.length == 0) return [];
    var results = <Post>[];
    await _db.collection("posts").get().then(
      (value) {
        value.docs.forEach(
          (element) {
            results.add(
              Post.fromMap(
                element.data(),
              ),
            );
          },
        );
      },
    );
    print("posts: $results");
    return results;
  }

  Future<void> insertComment(Comment comment) async {
    await _db
        .collection("comments")
        .doc(comment.commentId)
        .set(comment.toMap());
  }

  Future<List<Comment>> getComments(String postId) async {
    final query = await _db.collection("comments").get();
    if (query.docs.length == 0) return [];
    var results = <Comment>[];
    await _db
        .collection("comments")
        .where("postId", isEqualTo: postId)
        .get()
        .then(
      (value) {
        value.docs.forEach(
          (element) {
            results.add(
              Comment.fromMap(
                element.data(),
              ),
            );
          },
        );
      },
    );
    print("comments $results");
    return results;
  }
}
