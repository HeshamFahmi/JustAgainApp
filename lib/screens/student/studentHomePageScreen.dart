// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../main.dart';
import '../../sharedWidgets/customButton.dart';
import '../../sharedWidgets/customUSerCard.dart';
import '../../web_services/firebaseAuthHelper.dart';
import 'studentQuiz.dart';

class StudentHomePageScreen extends StatelessWidget {
  const StudentHomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          customSizedBox(0.0, MediaQuery.of(context).size.height * 0.2),
          CustomUserCard(
            title: "Start Quiz",
            color: studentColor,
            imagePath: quizIconUrl,
            screenName: const StudentQuiz(),
          ),
          customSizedBox(0.0, 20.0),
          InkWell(
            onTap: () => AuthenticationHelper()
                .signOut()
                .then((value) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage()),
                    )),
            child: Container(
              alignment: Alignment.center,
              child: CustomButton(
                  color: Colors.red,
                  title: "Logout",
                  widht: MediaQuery.of(context).size.width * 0.5),
            ),
          )
        ],
      ),
    ));
  }
}
