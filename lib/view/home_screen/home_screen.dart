import 'package:flutter/material.dart';
import 'package:noteapp/dummy_db.dart';
import 'package:noteapp/utils/color_constant.dart';
import 'package:noteapp/view/home_screen/widget/build_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedColorIndex = 0;
  TextEditingController title = TextEditingController();
  TextEditingController des = TextEditingController();
  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.mainblack,
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorConstant.mainwhite.withOpacity(0.9),
          child: Icon(
            Icons.add,
            color: ColorConstant.mainblack,
          ),
          onPressed: () {
            //to clear the controller when clicking the bottomsheet again
            title.clear();
            des.clear();
            date.clear();
            selectedColorIndex = 0;
            _customBottomSheet(context);
          },
        ),
        body: ListView.separated(
            padding: EdgeInsets.all(15),
            itemBuilder: (context, index) => BuildCard(
                noteColor:
                    DummyDb.noteColor[DummyDb.addnNote[index]['colorIndex']],
                //DummyDb.addnNote[index]['colorIndex'] this is an index bcoz int value is asssigned to colorIndex key
                onEdit: () {
                  //assign data to controllers
                  title.text = DummyDb.addnNote[index]['title'];
                  des.text = DummyDb.addnNote[index]['desc'];
                  date.text = DummyDb.addnNote[index]['date'];
                  selectedColorIndex = DummyDb.addnNote[index]['colorIndex'];
                  //another method
                  // title=TextEditingController(text: DummyDb.addnNote[index]['title']);
                  //index assigned to itmindex
                  _customBottomSheet(context, isEdit: true, itemIndex: index);
                },
                onDelete: () {
                  DummyDb.addnNote.removeAt(index);
                  setState(() {});
                },
                title: DummyDb.addnNote[index]['title'],
                date: DummyDb.addnNote[index]['date'],
                des: DummyDb.addnNote[index]['desc']),
            separatorBuilder: (context, index) => SizedBox(
                  height: 15,
                ),
            itemCount: DummyDb.addnNote.length),
      ),
    );
  }

  _customBottomSheet(BuildContext context,
      {bool isEdit = false, int? itemIndex}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: ColorConstant.sheetgrey,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Padding(
          padding:
              //to avoid keyboard overlap mediaquery used here
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return "Enter a title";
                  }
                },
                controller: title,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: ColorConstant.mainblack),
                    hintText: "Title",
                    fillColor: ColorConstant.mainwhite.withOpacity(0.5),
                    filled: true,
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.shade400,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                maxLines: 5, //description field height
                controller: des,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return "Enter Description";
                  }
                },
                decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.shade400,
                        )),
                    hintStyle: TextStyle(color: ColorConstant.mainblack),
                    hintText: "Description",
                    fillColor: ColorConstant.mainwhite.withOpacity(0.5),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: date,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    return null;
                  } else {
                    return "Enter date";
                  }
                },
                decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.red.shade400,
                        )),
                    hintStyle: TextStyle(color: ColorConstant.mainblack),
                    hintText: "Date",
                    fillColor: ColorConstant.mainwhite.withOpacity(0.5),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 30,
              ),
              StatefulBuilder(
                builder: (context, setColorState) => Row(
                  children: List.generate(
                    DummyDb.noteColor.length,
                    (index) => Expanded(
                      child: InkWell(
                        onTap: () {
                          selectedColorIndex = index;
                          setColorState(() {});
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 50,
                          decoration: BoxDecoration(
                              border: selectedColorIndex == index
                                  ? Border.all(width: 3)
                                  : null,
                              color: DummyDb.noteColor[index],
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                      child: Text("Cancel"),
                      decoration: BoxDecoration(
                          color: ColorConstant.mainwhite,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      isEdit
                          ? DummyDb.addnNote[itemIndex!] = {
                              "title": title.text,
                              "date": date.text,
                              "desc": des.text,
                              "colorIndex": selectedColorIndex
                            }
                          : DummyDb.addnNote.add({
                              "title": title.text,
                              "date": date.text,
                              "desc": des.text,
                              "colorIndex": selectedColorIndex
                            });
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      child: Text(
                        isEdit ? "Update" : "Save",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(
                          color: ColorConstant.mainwhite,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
