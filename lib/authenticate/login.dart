import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/util/ui_data.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          child: Column(
            children: [
              Image.asset(
                UIData.bg_login,
                height: 250,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Login',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 24, color: Colors.blueAccent[400]),
                        ),
                      ),
                      createSizeBox(20),
                      createUsernameField(),
                      createSizeBox(20),
                      createPasswordField(),
                      createSizeBox(10),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Forgot password',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueAccent[400],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      createSizeBox(10),
                      createLoginButton(),
                      createSizeBox(15),
                      Text.rich(
                        TextSpan(
                            text: "No account? ",
                            style: const TextStyle(fontSize: 14),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Register now!',
                                  style: TextStyle(
                                      color: Colors.pink[600],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => {
                                          Navigator.pushReplacementNamed(
                                              context, '/register')
                                        })
                            ]),
                      )
                    ],
                  ))
            ],
          ),
        ));
  }

  TextField createUsernameField() {
    return TextField(
        decoration: InputDecoration(
            hintText: 'Username',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
  }

  TextField createPasswordField() {
    return TextField(
        decoration: InputDecoration(
            hintText: 'Password',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))));
  }

  SizedBox createSizeBox(double boxHeight) {
    return SizedBox(
      height: boxHeight,
    );
  }

  SizedBox createLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: () => {}, child: const Text('Login')),
    );
  }
}
