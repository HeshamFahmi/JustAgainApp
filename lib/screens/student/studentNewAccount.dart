// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../sharedWidgets/customButton.dart';
import '../../sharedWidgets/customText.dart';
import '../../sharedWidgets/customTextField.dart';
import '../../web_services/firebaseAuthHelper.dart';
import '../../web_services/firestoreHelper.dart';
import 'homeStudentPage.dart';
import 'studentHomePageScreen.dart';

class StudentRegistration extends StatefulWidget {
  const StudentRegistration({Key? key}) : super(key: key);

  @override
  State<StudentRegistration> createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
                    title: "Create New Account ...",
                    txtSize: 20,
                    fontWeight: FontWeight.bold,
                    color: studentDarkColor!),
              ),
              customSizedBox(0.0, 10.0),
              CustomTextField(
                controller: emailController,
                inputType: TextInputType.emailAddress,
                hint: "Please Enter Your Email ...",
                obscureText: false,
              ),
              CustomTextField(
                controller: nameController,
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
              customSizedBox(0.0, 10.0),
              InkWell(
                onTap: () async {
                  AuthenticationHelper()
                      .signUp(emailController.text.toString(),
                          passwordController.text.toString())
                      .then((result) {
                    if (result == null) {
                      FirestoreHelper().addStudent(
                          nameController.text.toString(),
                          emailController.text.toString());
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
                    title: "Register Now ..."),
              ),
              customSizedBox(0.0, 15.0),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StudentHomePage())),
                child: Container(
                  alignment: Alignment.centerRight,
                  child: const CustomTxt(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    title: "Do You Have An Account ... Login Now ...",
                    txtSize: 17.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
