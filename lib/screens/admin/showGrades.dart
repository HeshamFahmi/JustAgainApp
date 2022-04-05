// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:just_again_test/sharedWidgets/customButton.dart';
import 'package:just_again_test/sharedWidgets/customGradeRow.dart';
import 'package:just_again_test/sharedWidgets/customTextField.dart';

import '../../constant.dart';

class ShowGrades extends StatefulWidget {
  const ShowGrades({Key? key}) : super(key: key);

  @override
  State<ShowGrades> createState() => _ShowGradesState();
}

class _ShowGradesState extends State<ShowGrades> {
  TextEditingController examCode = TextEditingController();
  List<String> studentsName = [];
  List<int> studentsGrades = [];
  bool gradesLoaded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Show Grades", adminColor, gradesIconUrl),
      body: Column(
        children: [
          customSizedBox(0.0, MediaQuery.of(context).size.height * 0.05),
          CustomTextField(
              controller: examCode,
              inputType: TextInputType.number,
              hint: "Please Enter Exam Code",
              obscureText: false),
          InkWell(
              onTap: () {
                setState(() {
                  gradesLoaded = true;
                  studentsGrades.clear();
                  studentsName.clear();
                  getStudentsGrades(examCode.text.toString());
                  Future.delayed(const Duration(seconds: 2));
                  FocusScope.of(context).unfocus();
                });
              },
              child: CustomButton(
                  color: adminColor,
                  title: "Show Grades",
                  widht: MediaQuery.of(context).size.width * 0.5)),
          gradesLoaded
              ? Center(
                  child: CircularProgressIndicator(
                  color: adminColor,
                ))
              : Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: ListView.builder(
                        itemCount: studentsGrades.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Column(children: [
                              CustomGradeRow(
                                title: "Name : ",
                                value: studentsName[index],
                                color: Colors.white,
                              ),
                              CustomGradeRow(
                                  title: "Grade : ",
                                  value: studentsGrades[index].toString(),
                                  color: Colors.white)
                            ]),
                          );
                        },
                      )),
                )
        ],
      ),
    );
  }

  getStudentsGrades(String examCode) {
    FirebaseFirestore.instance
        .collection('Grades')
        .doc("StudentsGrade")
        .collection(examCode)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        studentsName.add(doc["name"]);
        studentsGrades.add(doc["grade"]);
      }
      gradesLoaded = false;
    });
  }
}
