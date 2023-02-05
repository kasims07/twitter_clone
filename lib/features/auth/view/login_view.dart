import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/apis/auth_api.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/constants/constants.dart';
import 'package:twitter_clone/features/auth/controller/auth_controller.dart';
import 'package:twitter_clone/features/auth/view/signup_view.dart';
import 'package:twitter_clone/theme/pallete.dart';

import '../widgets/auth_field.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});
  static route() => MaterialPageRoute(builder: (context) => const LoginView());
  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  AppBar appBar = UIConstants.appBar();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  void onLogin() {
    ref.read(authControllerProvider.notifier).Login(
        email: emailcontroller.text,
        password: passwordcontroller.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider.notifier).state;
    return Scaffold(
      appBar: appBar,
      body: isLoading
          ? const Loader()
          : Center(
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
                          onTap: onLogin,
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
