// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:just_again_test/constant.dart';
import 'package:just_again_test/screens/admin/homeAdminPage.dart';
import 'package:just_again_test/web_services/firestoreHelper.dart';

import '../../sharedWidgets/customButton.dart';
import '../../sharedWidgets/customText.dart';
import '../../sharedWidgets/customTextField.dart';
import '../../web_services/firebaseAuthHelper.dart';
import 'adminHomePageScreen.dart';

class AdminRegistration extends StatefulWidget {
  const AdminRegistration({Key? key}) : super(key: key);

  @override
  State<AdminRegistration> createState() => _AdminRegistrationState();
}

class _AdminRegistrationState extends State<AdminRegistration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Admin", adminColor, adminIconUrl),
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
                    color: adminDarkColor!),
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
                      FirestoreHelper().addAdmin(nameController.text.toString(),
                          emailController.text.toString());
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const AdminHomePageScreen()));
                    } else {
                      customToast(result, faildColor);
                    }
                  });
                },
                child: CustomButton(
                    widht: double.infinity,
                    color: adminColor,
                    title: "Register Now ..."),
              ),
              customSizedBox(0.0, 15.0),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminHomePage())),
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
