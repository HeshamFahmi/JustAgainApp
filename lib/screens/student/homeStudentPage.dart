// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:just_again_test/screens/student/studentHomePageScreen.dart';
import 'package:just_again_test/sharedWidgets/customButton.dart';
import 'package:just_again_test/sharedWidgets/customText.dart';
import 'package:just_again_test/sharedWidgets/customTextField.dart';

import '../../constant.dart';
import '../../web_services/firebaseAuthHelper.dart';
import 'studentNewAccount.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({Key? key}) : super(key: key);

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Student", studentColor, studentIconUrl),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              customSizedBox(0.0, MediaQuery.of(context).size.height * 0.1),
              Container(
                alignment: Alignment.centerLeft,
                child: CustomTxt(
                    title: "Student Login",
                    txtSize: 20,
                    fontWeight: FontWeight.bold,
                    color: studentDarkColor!),
              ),
              customSizedBox(0.0, 10.0),
              CustomTextField(
                controller: emailController,
                inputType: TextInputType.name,
                hint: "Please Enter Your Name ...",
                obscureText: false,
              ),
              CustomTextField(
                controller: passwordController,
                inputType: TextInputType.visiblePassword,
                hint: "Please Enter Your Password ...",
                obscureText: true,
              ),
              customSizedBox(0.0, 5.0),
              Container(
                alignment: Alignment.centerRight,
                child: const CustomTxt(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  title: "Forget Your Password ??",
                  txtSize: 17.0,
                ),
              ),
              customSizedBox(0.0, 10.0),
              InkWell(
                onTap: () async {
                  AuthenticationHelper()
                      .signIn(emailController.text.toString(),
                          passwordController.text.toString())
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const StudentHomePageScreen()));
                    } else {
                      customToast(result, faildColor);
                    }
                  });
                },
                child: CustomButton(
                    widht: double.infinity,
                    color: studentColor,
                    title: "Login Now ..."),
              ),
              customSizedBox(0.0, 10.0),
              const CustomTxt(
                  title: "--- OR ---",
                  txtSize: 20.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
              InkWell(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StudentRegistration()),
                ),
                child: CustomButton(
                    widht: double.infinity,
                    color: studentDarkColor!,
                    title: "Create a New Account ..."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
