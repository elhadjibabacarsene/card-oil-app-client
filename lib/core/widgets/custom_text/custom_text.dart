import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum CustomTextFontWeight { bold, regular, semiBold, extraBold }

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.customTextFontWeight,
    this.textAlign,
    this.color,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final CustomTextFontWeight customTextFontWeight;
  final TextAlign? textAlign;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    getFontWeight() {
      switch (customTextFontWeight) {
        case CustomTextFontWeight.bold:
          return FontWeight.w700;
        case CustomTextFontWeight.regular:
          return FontWeight.w400;
        case CustomTextFontWeight.semiBold:
          return FontWeight.w600;
        case CustomTextFontWeight.extraBold:
          return FontWeight.w800;
      }
    }

    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.overpass(
        fontSize: fontSize,
        fontWeight: getFontWeight(),
        color: color,
      ),
    );
  }
}
