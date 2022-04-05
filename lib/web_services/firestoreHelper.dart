// ignore_for_file: file_names

import 'package:just_again_test/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  Future<void> addAdmin(String name, String email) {
    CollectionReference users = FirebaseFirestore.instance.collection('admin');
    return users
        .add({'name': name, 'email': email})
        .then((value) => customToast("Success", successColor))
        .catchError((error) => customToast("error in : $error", faildColor));
  }

  Future<void> addStudent(String name, String email) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('student');
    return users
        .add({'name': name, 'email': email})
        .then((value) => customToast("Success", successColor))
        .catchError((error) => customToast("error in : $error", faildColor));
  }

  Future<void> addQuestion(
      String examCode,
      String questionNum,
      String question,
      String answer1,
      String answer2,
      String answer3,
      String answer4,
      String answer5,
      String correctAnswer) {
    CollectionReference questions = FirebaseFirestore.instance
        .collection('Quizes')
        .doc(examCode)
        .collection("Questions");
    return questions
        .doc(questionNum)
        .set({
          "question": question,
          "answer1": answer1,
          "answer2": answer2,
          "answer3": answer3,
          "answer4": answer4,
          "answer5": answer5,
          "correctAnswer": correctAnswer
        })
        .then((value) => customToast("Success", successColor))
        .catchError((error) => customToast("error in : $error", faildColor));
  }

  Future<void> addQuestionNumbers(
    String examCode,
    String questionNums,
  ) {
    CollectionReference questions =
        FirebaseFirestore.instance.collection('Quizes');

    return questions
        .doc(examCode)
        .set({
          "NumOfQuestions": questionNums,
        })
        .then((value) => customToast("Success", successColor))
        .catchError((error) => customToast("error in : $error", faildColor));
  }
}
