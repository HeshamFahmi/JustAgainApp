import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'sharedWidgets/customText.dart';

String adminIconUrl =
    "https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/avat-01-512.png";
String studentIconUrl =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnrNlneQHrdb0FSxBq2GHPjsPkjTwPcautFA&usqp=CAU";

String quizIconUrl =
    "https://thumbs.dreamstime.com/b/quiz-icon-simple-vector-170164971.jpg";
String gradesIconUrl = "https://cdn-icons-png.flaticon.com/512/748/748449.png";

Color adminColor = Colors.pink;
Color? adminDarkColor = Colors.pink[900];
Color studentColor = Colors.purple;
Color? studentDarkColor = Colors.purple[900];

Color successColor = Colors.greenAccent;
Color faildColor = Colors.redAccent;

customAppBar(String title, Color color, String iconTitle) {
  return AppBar(
    title: CustomTxt(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      title: title,
      txtSize: 20.0,
    ),
    backgroundColor: color,
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Image.network(
          iconTitle,
          width: 50,
          height: 100,
        ),
      ),
    ),
  );
}

customSizedBox(dynamic width, dynamic height) {
  return SizedBox(
    height: height,
    width: width,
  );
}

customToast(String title, Color color) {
  return Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}
