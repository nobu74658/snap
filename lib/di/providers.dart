import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:snap/models/db/database_manager.dart';
import 'package:snap/models/repositories/post_repository.dart';
import 'package:snap/models/repositories/user_repository.dart';
import 'package:snap/view_models/post_view_model.dart';

import '../view_models/login_view_model.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels
];

List<SingleChildWidget> independentModels = [
  Provider<DatabaseManager>(
    create: (_) => DatabaseManager(),
  ),
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<DatabaseManager, UserRepository>(
    update: (_, dbManager, repo) => UserRepository(dbManager: dbManager),
  ),
  ProxyProvider<DatabaseManager, PostRepository>(
      update: (_, dbManager, repo) => PostRepository(dbManager: dbManager))
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<LoginViewModel>(
    create: (context) => LoginViewModel(
      userRepository: context.read<UserRepository>(),
    ),
  ),
  ChangeNotifierProvider<PostViewModel>(
    create: (context) => PostViewModel(
      userRepository: context.read<UserRepository>(),
      postRepository: context.read<PostRepository>(),
    ),
  ),
];
