import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/util/ui_data.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();

  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPwdFocusNode = FocusNode();
  final emailFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Image.asset(
              UIData.bg_register,
              height: size.height * 0.35,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  SizedBox(
                      width: size.width,
                      child: const Text(
                        UIData.txt_register,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      controller: usernameController,
                      focusNode: usernameFocusNode,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: UIData.txt_username,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      obscureText: true,
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: UIData.txt_pwd,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      obscureText: true,
                      controller: confirmPasswordController,
                      focusNode: confirmPwdFocusNode,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: UIData.txt_confirm_pwd,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      focusNode: emailFocusNode,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email_rounded),
                          hintText: UIData.txt_email,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)))),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width,
                    child: ElevatedButton(
                      onPressed: () => {
                        register(
                            usernameController.text,
                            passwordController.text,
                            confirmPasswordController.text,
                            emailController.text)
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent),
                      child: const Text(UIData.txt_register),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text.rich(TextSpan(
                    text: UIData.txt_has_account,
                    children: <TextSpan>[
                      TextSpan(
                        text: UIData.txt_login_now,
                        recognizer: TapGestureRecognizer()
                          ..onTap = switchToLoginScreen,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent),
                      )
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void register(String username, String pwd, String confirmPwd, String email) {
    if (username.isEmpty) {
      showDialog(
          context: context,
          builder: (context) =>
              createDialog('Warning', UIData.empty_username_err));

      usernameFocusNode.requestFocus();
      return;
    }

    if (pwd.isEmpty) {
      showDialog(
          context: context,
          builder: (context) =>
              createDialog('Warning', UIData.empty_username_err));

      passwordFocusNode.requestFocus();
      return;
    }

    if (confirmPwd.isEmpty) {
      showDialog(
          context: context,
          builder: (context) =>
              createDialog('Warning', UIData.empty_confirm_pwd_err));

      confirmPwdFocusNode.requestFocus();
      return;
    }

    if (pwd.toLowerCase() != confirmPwd.toLowerCase()) {
      showDialog(
          context: context,
          builder: (context) =>
              createDialog('Warning', UIData.wrong_confirm_pwd_err));

      confirmPwdFocusNode.requestFocus();
      return;
    }

    if (email.isEmpty) {
      showDialog(
          context: context,
          builder: (context) =>
              createDialog('Warning', UIData.empty_email_err));

      emailFocusNode.requestFocus();
      return;
    }

    Navigator.pushReplacementNamed(context, UIData.route_login);
  }

  CupertinoAlertDialog createDialog(String title, String msg) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: [
        CupertinoDialogAction(
          child: const Text('Ok'),
          onPressed: () => {Navigator.pop(context)},
        )
      ],
    );
  }

  void switchToLoginScreen() {
    Navigator.pushReplacementNamed(context, UIData.route_login);
  }
}
