
import 'package:blog_app/lib/View/home.dart';
import 'package:blog_app/lib/View/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'reusable.dart';
import 'textController.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(children: [
          title,
         Padding(padding: const EdgeInsets.only(bottom: 30), child: loginSubtitle,),  
          textField(labelEmail, false, loginEmailTextFieldController),
          textField(labelPassword, true, loginPasswordTextFieldController),
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
              child: loginButton,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              otherWiseForLogin,
              TextButton(
                  onPressed: () {
                    Get.to(() => const MySignupPage());
                  },
                  child: signUpOptionTextButton)
            ],
          )
        ]),
      ),
    ));
  }
}
