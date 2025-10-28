import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 55,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.bgcolor = Appcolors.primarycolor,
    this.bordercolor,
    this.textcolor,
  });
  final String text;
  final Function() onPressed;
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final Color bgcolor;
  final Color? bordercolor;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          side: bordercolor != null
              ? BorderSide(color: bordercolor ?? Appcolors.blackcolor)
              : BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.styleSize16(
            fontWeight: FontWeight.w500,
            color: textcolor ?? Appcolors.whitecolor,
          ),
        ),
      ),
    );
  }
}
