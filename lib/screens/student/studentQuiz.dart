// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:just_again_test/constant.dart';

import '../../sharedWidgets/customButton.dart';
import '../../sharedWidgets/customText.dart';
import '../../sharedWidgets/customTextField.dart';
import 'studentQuizQuestions.dart';

class StudentQuiz extends StatefulWidget {
  const StudentQuiz({Key? key}) : super(key: key);

  @override
  State<StudentQuiz> createState() => _StudentQuizState();
}

class _StudentQuizState extends State<StudentQuiz> {
  TextEditingController examCode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Quiz", studentColor, quizIconUrl),
      body: Column(
        children: [
          customSizedBox(0.0, MediaQuery.of(context).size.height * 0.05),
          CustomTxt(
              title: "Please fill This Fields to complete Exam Questions",
              txtSize: 20,
              fontWeight: FontWeight.bold,
              color: studentDarkColor!),
          CustomTextField(
              controller: examCode,
              inputType: TextInputType.number,
              hint: "Please Enter Exam Code",
              obscureText: false),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentQuizQestions(
                              examCode: examCode.text.toString(),
                            )));
              },
              child: CustomButton(
                  color: studentColor,
                  title: "Start Quiz",
                  widht: MediaQuery.of(context).size.width * 0.5)),
        ],
      ),
    );
  }
}
