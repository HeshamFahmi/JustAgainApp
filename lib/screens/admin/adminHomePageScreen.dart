// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:just_again_test/screens/admin/addQuiz.dart';
import 'package:just_again_test/screens/admin/showGrades.dart';
import 'package:just_again_test/sharedWidgets/customButton.dart';

import '../../constant.dart';
import '../../main.dart';
import '../../sharedWidgets/customText.dart';
import '../../sharedWidgets/customUSerCard.dart';
import '../../web_services/firebaseAuthHelper.dart';

class AdminHomePageScreen extends StatelessWidget {
  const AdminHomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          customSizedBox(0.0, MediaQuery.of(context).size.height * 0.2),
          const CustomTxt(
              title: "Welcome Back ... Please Choose ....",
              txtSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black),
          customSizedBox(0.0, MediaQuery.of(context).size.height * 0.05),
          CustomUserCard(
            title: "Add A Quiz ....",
            color: adminColor,
            imagePath: quizIconUrl,
            screenName: const QuizScreen(),
          ),
          CustomUserCard(
              title: "Show Student Result",
              color: studentColor,
              imagePath: gradesIconUrl,
              screenName: const ShowGrades()),
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
