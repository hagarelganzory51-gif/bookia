import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';


enum DialogType { success, error, warning }

// ignore: strict_top_level_inference
showMyDialog(
  BuildContext context,
  String message, {
  DialogType type = DialogType.error,
}) {


enum DialogType { success, error,warning }

// ignore: strict_top_level_inference, unused_element
showMyDialog(BuildContext context,
 String message,{
  DialogType type = DialogType.error,}
 ) {

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(20),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: type == DialogType.error
          ? Appcolors.redcolor
          : type == DialogType.success

          ? Appcolors.primarycolor
          : Appcolors.cardcolor,
      content: Text(
        message,
        style: TextStyles.styleSize18(color: Appcolors.whitecolor),
      ),
    ),
  );
}

// ignore: strict_top_level_inference, unused_element
showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Center(child: CircularProgressIndicator());
    },
  );
}
