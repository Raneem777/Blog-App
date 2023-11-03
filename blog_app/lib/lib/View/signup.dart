import 'package:blog_app/lib/View/home.dart';
import 'package:blog_app/lib/View/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'textController.dart';
import 'reusable.dart';

class MySignupPage extends StatefulWidget {
  const MySignupPage({super.key});

  @override
  State<MySignupPage> createState() => _MySignupPageState();
}

class _MySignupPageState extends State<MySignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(children: [
        title,
        Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: signInSubtitle,
        ),
        textField(labelEmail, false, signupEmailTextFieldController),
        textField(labelPassword, true, signupPasswordTextFieldController),
        textField(labelUsername, false, signupUsernameTextFieldController),
        Container(
          foregroundDecoration:
              BoxDecoration(borderRadius: BorderRadius.circular(50)),
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(30, 15, 30, 5),
          child: ElevatedButton(
            onPressed: () {
              if (isValidPassword(signupPasswordTextFieldController.text) &&
                  isValidEmail(signupEmailTextFieldController.text) &&
                  isValidUsername(signupUsernameTextFieldController.text)) {
                Get.to(() => const MyHomePage());
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Warning'),
                      content: const Text('Check the textFields again'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            style: buttonStyle,
            child: signUpButton,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            otherWiseForSignup,
            TextButton(
                onPressed: () {
                  Get.to(() => const MyLoginPage());
                },
                child: loginOptionTextButton)
          ],
        )
      ]),
    )));
  }
}
