import 'package:card_oil/constants/size/size.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors/app_colors.dart';
import '../../widgets/custom_text/custom_text.dart';
import 'components/payment_services_body_screen.dart';

class PaymentServicesScreen extends StatelessWidget {
  const PaymentServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Choisir mode de paiement')
      ),
      backgroundColor: greyQuaternaryColor,
      body: Padding(
        padding: getPaddingHScreen(context),
        child: const PaymentServicesBodyScreen(),
      ),
    );
  }
}
