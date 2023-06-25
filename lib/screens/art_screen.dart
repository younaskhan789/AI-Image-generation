import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_generator/const/colors.dart';

class ArtScreen extends StatefulWidget {
  const ArtScreen({Key? key}) : super(key: key);

  @override
  State<ArtScreen> createState() => _ArtScreenState();
}

class _ArtScreenState extends State<ArtScreen> {
  List imgList = [];

  getImage() async {
    final directory = Directory("storage/emulated/0/AI Image generation");
    imgList = directory.listSync();
    print(imgList);
  }

  // here the pop image when click on the image in art then the picture will be shown
  PopImage(filepath) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: MediaQuery.of(context).size.width*3,
                height: MediaQuery.of(context).size.height/2,
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(12)),
                child: Image.file(filepath ,fit: BoxFit.fitHeight,),
              ),
            ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Arts Gallery",
          style: TextStyle(
            fontFamily: "poppin_bold",
            color: whiteColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 300,mainAxisSpacing: 8,crossAxisSpacing: 8),
            itemCount: imgList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  PopImage(imgList[index]);
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Image.file(imgList[index],fit: BoxFit.cover,),
                ),
              );
            }),
      ),
    );
  }
}
