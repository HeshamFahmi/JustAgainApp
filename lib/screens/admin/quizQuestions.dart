// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:just_again_test/screens/admin/adminHomePageScreen.dart';
import 'package:just_again_test/web_services/firestoreHelper.dart';

import '../../constant.dart';
import '../../sharedWidgets/customButton.dart';
import '../../sharedWidgets/customText.dart';
import '../../sharedWidgets/customTextField.dart';

class QuizQuestions extends StatefulWidget {
  final String examCode;
  final String numOfQuestions;
  const QuizQuestions({
    Key? key,
    required this.examCode,
    required this.numOfQuestions,
  }) : super(key: key);

  @override
  State<QuizQuestions> createState() => _QuizQuestionsState();
}

class _QuizQuestionsState extends State<QuizQuestions> {
  TextEditingController question = TextEditingController();
  List<TextEditingController> answers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];
  TextEditingController correctAnswer = TextEditingController();
  int countQuestions = 1;

  @override
  void initState() {
    super.initState();
    FirestoreHelper()
        .addQuestionNumbers(widget.examCode, widget.numOfQuestions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Show Grades", adminColor, gradesIconUrl),
      body: SingleChildScrollView(
        child: Column(
          children: [
            customSizedBox(0.0, MediaQuery.of(context).size.height * 0.05),
            CustomTxt(
                title: "Please fill This Fields to complete Exam Questions",
                txtSize: 20,
                fontWeight: FontWeight.bold,
                color: adminDarkColor!),
            CustomTextField(
                controller: question,
                inputType: TextInputType.name,
                hint: "Please Enter Question $countQuestions",
                obscureText: false),
            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, index) {
                return CustomTextField(
                    controller: answers[index],
                    inputType: TextInputType.name,
                    hint: "Please Enter Answer ${index + 1}",
                    obscureText: false);
              },
            ),
            CustomTextField(
                controller: correctAnswer,
                inputType: TextInputType.name,
                hint: "Please Enter The Correct Answer",
                obscureText: false),
            countQuestions < int.parse(widget.numOfQuestions)
                ? InkWell(
                    onTap: () {
                      setState(() {
                        FirestoreHelper().addQuestion(
                            widget.examCode,
                            countQuestions.toString(),
                            question.text.toString(),
                            answers[0].text.toString(),
                            answers[1].text.toString(),
                            answers[2].text.toString(),
                            answers[3].text.toString(),
                            answers[4].text.toString(),
                            correctAnswer.text.toString());

                        question.clear();
                        answers[0].clear();
                        answers[1].clear();
                        answers[2].clear();
                        answers[3].clear();
                        answers[4].clear();
                        correctAnswer.clear();

                        countQuestions++;
                      });
                    },
                    child: CustomButton(
                        color: adminColor,
                        title: "Next Question ...",
                        widht: MediaQuery.of(context).size.width * 0.5))
                : InkWell(
                    onTap: () {
                      FirestoreHelper().addQuestion(
                          widget.examCode,
                          countQuestions.toString(),
                          question.text.toString(),
                          answers[0].text.toString(),
                          answers[1].text.toString(),
                          answers[2].text.toString(),
                          answers[3].text.toString(),
                          answers[4].text.toString(),
                          correctAnswer.text.toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AdminHomePageScreen()));
                    },
                    child: CustomButton(
                        color: adminColor,
                        title: "End Exam",
                        widht: MediaQuery.of(context).size.width * 0.5)),
          ],
        ),
      ),
    );
  }
}
