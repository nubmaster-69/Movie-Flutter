import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/util/ui_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

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
                UIData.bg_login,
                height: size.height * 0.35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        UIData.txt_login,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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
                            hintText: UIData.txt_pwd,
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)))),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          UIData.txt_forgot_pwd,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => {
                          login(
                              usernameController.text, passwordController.text)
                        },
                        child: const Text(UIData.txt_login),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text.rich(TextSpan(
                        text: UIData.txt_no_account,
                        children: <TextSpan>[
                          TextSpan(
                            text: UIData.txt_regiser_now,
                            recognizer: TapGestureRecognizer()
                              ..onTap = switchToRegisterScreen,
                            style: const TextStyle(
                                color: Colors.pinkAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ]))
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void login(String username, String password) {
    if (username.isEmpty) {
      showDialog(
          context: context,
          builder: (context) =>
              createDialog('Warning', UIData.empty_username_err));

      usernameFocusNode.requestFocus();
      return;
    }

    if (password.isEmpty) {
      showDialog(
          context: context,
          builder: (context) => createDialog('Warning', UIData.empty_pwd_err));

      passwordFocusNode.requestFocus();
      return;
    }

    Navigator.pushReplacementNamed(context, UIData.route_register);
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

  void switchToRegisterScreen() {
    Navigator.pushReplacementNamed(context, UIData.route_register);
  }
}
