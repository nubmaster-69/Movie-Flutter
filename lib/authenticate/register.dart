import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/util/ui_data.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset(
            UIData.bg_register,
            height: 220,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Register',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.pink[500], fontSize: 24),
                  ),
                ),
                createSizeBox(10),
                createUsernameField(),
                createSizeBox(10),
                createPasswordField(),
                createSizeBox(10),
                createConfirmPasswordField(),
                createSizeBox(10),
                createEmailField(),
                createSizeBox(10),
                createRegisterButton(),
                createSizeBox(10),
                Text.rich(TextSpan(
                    text: 'Has account? ',
                    style: TextStyle(fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Login now!',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => {
                                  Navigator.pushReplacementNamed(
                                      context, '/login')
                                },
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.bold))
                    ]))
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox createSizeBox(double boxHeight) {
    return SizedBox(
      height: boxHeight,
    );
  }

  TextField createUsernameField() {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Username',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  TextField createPasswordField() {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  TextField createConfirmPasswordField() {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Confirm Password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  TextField createEmailField() {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Email',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }

  SizedBox createRegisterButton() {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(onPressed: () => {}, child: Text('Register')));
  }
}
