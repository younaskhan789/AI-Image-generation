import 'package:flutter/material.dart';

import '../const/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var textController= TextEditingController();
    return Expanded(
      child: Container(
        height:44,
        padding: EdgeInsets.symmetric(vertical: 4,horizontal: 16),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextFormField(
          controller: textController,
          decoration: InputDecoration(
              hintText: "eg 'A monkey on moon'",
              border: InputBorder.none
          ),
        ),
      ),
    );
  }
}