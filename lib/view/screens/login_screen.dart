import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:snap/view/components/button_with_icon.dart';
import 'package:snap/view/screens/home_screen.dart';
import 'package:snap/view_models/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<LoginViewModel>(builder: (context, model, child) {
          return model.isLoading
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "SNAP",
                      style: TextStyle(
                        fontFamily: 'Tangerine',
                        fontSize: 48,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    ButtonWithIcon(
                      iconData: FontAwesomeIcons.arrowRightToBracket,
                      label: "サインイン",
                      onPressed: () => login(context),
                    )
                  ],
                );
        }),
      ),
    );
  }

  login(BuildContext context) async {
    final loginViewModel = context.read<LoginViewModel>();
    await loginViewModel.signIn();
    if (!loginViewModel.isSuccessful) {
      Fluttertoast.showToast(msg: "サインインに失敗しました");
      return;
    }
    _openHomeScreen(context);
  }

  void _openHomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }
}
