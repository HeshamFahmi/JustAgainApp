import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:just_again_test/constant.dart';
import 'package:just_again_test/screens/admin/homeAdminPage.dart';
import 'package:just_again_test/screens/student/homeStudentPage.dart';
import 'package:just_again_test/sharedWidgets/customText.dart';
import 'package:just_again_test/sharedWidgets/customUSerCard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Just_Again_App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          customSizedBox(0.0, MediaQuery.of(context).size.height * 0.2),
          const CustomTxt(
              title: "Welcome Back ... Please Choose Your Role ...",
              txtSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue),
          customSizedBox(0.0, MediaQuery.of(context).size.height * 0.05),
          CustomUserCard(
            title: "Admin",
            color: adminColor,
            imagePath: adminIconUrl,
            screenName: const AdminHomePage(),
          ),
          CustomUserCard(
              title: "Student",
              color: studentColor,
              imagePath: studentIconUrl,
              screenName: const StudentHomePage()),
        ],
      ),
    ));
  }
}
