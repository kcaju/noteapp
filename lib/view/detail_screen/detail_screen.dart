import 'package:flutter/material.dart';
import 'package:noteapp/utils/color_constant.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {super.key,
      required this.title,
      required this.date,
      required this.des,
      required this.noteColor});
  final String title, date, des;
  final Color noteColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: ColorConstant.mainblack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    des,
                    style: TextStyle(
                      color: ColorConstant.mainblack,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: noteColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
