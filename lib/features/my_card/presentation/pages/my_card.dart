import 'package:card_oil/constants/size/size.dart';
import 'package:card_oil/core/colors/app_colors.dart';
import 'package:card_oil/core/widgets/custom_text/custom_text.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    buildCard() {
      return Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: menthePrimaryColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              Image.asset(
                'assets/images/mask-card.png',
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const CustomText(
                          text: 'Card Oil',
                          fontSize: 22,
                          color: whiteColor,
                          customTextFontWeight: CustomTextFontWeight.bold,
                        ),
                        Image.asset('assets/images/logo-white.png', height: 35,)
                      ],
                    ),
                    const Spacer(flex: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         CustomText(
                          text: '1234 5678 9000 0000',
                          fontSize: 22,
                          color: whiteColor,
                          customTextFontWeight: CustomTextFontWeight.regular,
                        ),
                         CustomText(
                          text: '05/24',
                          fontSize: 14,
                          color: whiteColor,
                          customTextFontWeight: CustomTextFontWeight.regular,
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              )
            ],
          ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma carte'),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingScreenW),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              buildCard(),
            ],
          )),
    );
  }
}
