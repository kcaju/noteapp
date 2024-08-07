import 'package:flutter/material.dart';
import 'package:noteapp/utils/color_constant.dart';
import 'package:share_plus/share_plus.dart';

class BuildCard extends StatelessWidget {
  const BuildCard({
    super.key,
    required this.title,
    required this.date,
    required this.des,
    this.onDelete,
    this.onEdit,
    required this.noteColor,
  });
  final String title, date, des;
  final void Function()? onDelete;
  final void Function()? onEdit;
  final Color noteColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: noteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: ColorConstant.mainblack),
              ),
              Spacer(),
              IconButton(
                onPressed: onEdit,
                icon: Icon(
                  Icons.edit,
                  color: ColorConstant.mainblack,
                ),
              ),
              IconButton(
                onPressed: onDelete,
                icon: Icon(
                  Icons.delete,
                  color: ColorConstant.mainblack,
                ),
              ),
            ],
          ),
          Text(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            des,
            style: TextStyle(color: ColorConstant.mainblack.withOpacity(0.7)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(color: ColorConstant.mainblack, fontSize: 18),
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
    );
  }
}
