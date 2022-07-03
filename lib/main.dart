import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snap/di/providers.dart';
import 'package:snap/firebase_options.dart';
import 'package:snap/styles/style.dart';
import 'package:snap/view/screens/home_screen.dart';
import 'package:snap/view/screens/login_screen.dart';
import 'package:snap/view_models/login_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: globalProviders,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();

    return MaterialApp(
      title: 'SNAP',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: BoldFont,
      ),
      home: FutureBuilder(
        future: loginViewModel.isSignIn(),
        builder: (context, AsyncSnapshot<bool> snapshot){
          if (snapshot.hasData && snapshot.data == true){
            return HomeScreen();
          } else{
            return LoginScreen();
          }
        },
      ),
    );
  }
}
