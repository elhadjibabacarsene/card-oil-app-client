import 'package:card_oil/constants/colors/app_colors.dart';
import 'package:card_oil/ui/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class PaymentServiceItem extends StatelessWidget {
  const PaymentServiceItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
    required this.iconContainerColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color iconContainerColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Widget iconContainer() => Container(
          width: 56,
          height: 56,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: iconContainerColor,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Icon(icon, color: Colors.white,),
        );

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(14),
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(25.0),
          border: Border.all(width: 1, color: greyQuinaryColor)
        ),
        child: Row(
          children: [
            iconContainer(),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: CustomText(
                text: title,
                fontSize: 18,
                customTextFontWeight: CustomTextFontWeight.bold,
                color: blueDarkPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
