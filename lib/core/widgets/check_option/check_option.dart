import 'package:flutter/material.dart';

import '../custom_text/custom_text.dart';

class CheckOption extends StatelessWidget {
  const CheckOption(
      {Key? key, required this.title, required this.status, this.onTap})
      : super(key: key);

  final String title;
  final bool status;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: title,
              fontSize: 16,
              customTextFontWeight: CustomTextFontWeight.semiBold,
            ),
            /*Image.asset(
              'assets/icons/${status ? 'check' : 'uncheck'}.png',
              width: 24,
              height: 24,
            ),*/
          ],
        ),
      ),
    );
  }
}
