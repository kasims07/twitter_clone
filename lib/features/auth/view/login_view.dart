import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/features/auth/view/signup_view.dart';
import 'package:twitter_clone/theme/pallete.dart';

import '../widgets/auth_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static route() => MaterialPageRoute(builder: (context) => const LoginView());
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  AppBar appBar = UIConstants.appBar();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                //TextField 1
                AuthField(
                  controller: emailcontroller,
                  hintText: '',
                ),
                const SizedBox(
                  height: 25,
                ),
                //TextField 2
                AuthField(
                  controller: passwordcontroller,
                  hintText: '',
                ),
                const SizedBox(
                  height: 40,
                ),
                //button
                Align(
                  alignment: Alignment.topRight,
                  child: RoundedSmallButton(
                    onTap: () {},
                    label: 'Done',
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                RichText(
                    text: TextSpan(
                        text: "Don't have an account?",
                        style: const TextStyle(fontSize: 16),
                        children: [
                      TextSpan(
                          text: " Sing Up",
                          style: const TextStyle(
                              color: Pallete.blueColor, fontSize: 16),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                SignUpView.route(),
                              );
                            }),
                    ]))
                //textspan
              ],
            ),
          ),
        ),
      ),
    );
  }
}
