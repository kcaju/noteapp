import 'package:flutter/material.dart';
import 'package:noteapp/utils/color_constant.dart';
import 'package:share_plus/share_plus.dart';

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: noteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: ColorConstant.mainblack,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  des,
                  style: TextStyle(
                    color: ColorConstant.mainblack,
                    fontSize: 20,
                  ),
                ),
                // Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      date,
                      style: TextStyle(
                          color: ColorConstant.mainblack, fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {
                        //share text
                        Share.share('$title \n $des \n $date');
                      },
                      icon: Icon(
                        Icons.share,
                        color: ColorConstant.mainblack,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
