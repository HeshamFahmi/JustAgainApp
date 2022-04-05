// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'customText.dart';

class CustomUserCard extends StatelessWidget {
  final String title;
  final Color color;
  final String imagePath;
  final dynamic screenName;
  const CustomUserCard({
    Key? key,
    required this.title,
    required this.color,
    required this.imagePath,
    required this.screenName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => screenName)),
      child: Card(
        color: color,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  imagePath,
                  width: 100,
                  height: 150,
                ),
              ),
              CustomTxt(
                  title: title,
                  txtSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ],
          ),
        ),
        elevation: 8,
        shadowColor: Colors.green,
        margin: const EdgeInsets.all(20),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green, width: 1)),
      ),
    );
  }
}
