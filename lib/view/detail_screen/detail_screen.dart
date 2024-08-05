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
        backgroundColor: ColorConstant.mainblack,
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                width: double.infinity,
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
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          date,
                          style: TextStyle(
                              color: ColorConstant.blue.withOpacity(0.8),
                              fontSize: 18),
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
                decoration: BoxDecoration(
                  color: noteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
