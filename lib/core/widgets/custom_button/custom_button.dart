import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.title, this.onPressed, this.isActive = true})
      : super(key: key);

  final String title;
  final VoidCallback? onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(
            isActive ? menthePrimaryColor : menthePrimaryColor.withOpacity(0.5),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onPressed: isActive ? onPressed : null,
        child: CustomText(
          text: title,
          customTextFontWeight: CustomTextFontWeight.semiBold,
          fontSize: 18,
          color: whiteColor,
        ),
      ),
    );
  }
}
