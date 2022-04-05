// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:just_again_test/screens/admin/quizQuestions.dart';
import 'package:just_again_test/sharedWidgets/customText.dart';

import '../../constant.dart';
import '../../sharedWidgets/customButton.dart';
import '../../sharedWidgets/customTextField.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  TextEditingController examCode = TextEditingController();
  TextEditingController examNumOfQuestions = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Show Grades", adminColor, gradesIconUrl),
      body: Column(
        children: [
          customSizedBox(0.0, MediaQuery.of(context).size.height * 0.05),
          CustomTxt(
              title: "Please fill This Fields to complete Exam Questions",
              txtSize: 20,
              fontWeight: FontWeight.bold,
              color: adminDarkColor!),
          CustomTextField(
              controller: examCode,
              inputType: TextInputType.number,
              hint: "Please Enter Exam Code",
              obscureText: false),
          CustomTextField(
              controller: examNumOfQuestions,
              inputType: TextInputType.number,
              hint: "Please Enter Numbers of Questions",
              obscureText: false),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizQuestions(
                            examCode: examCode.text.toString(),
                            numOfQuestions:
                                examNumOfQuestions.text.toString())));
              },
              child: CustomButton(
                  color: adminColor,
                  title: "Start Exam",
                  widht: MediaQuery.of(context).size.width * 0.5)),
        ],
      ),
    );
  }
}
