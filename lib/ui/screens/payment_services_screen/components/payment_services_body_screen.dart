import 'package:card_oil/ui/screens/payment_services_screen/components/payment_services_item/payment_service_item.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors/app_colors.dart';

class PaymentServicesBodyScreen extends StatelessWidget {
  const PaymentServicesBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          PaymentServiceItem(
            title: 'Payer par QR code',
            icon: Icons.qr_code_outlined,
            onPressed: () {},
            iconContainerColor: yellowDarkColor,
          ),
          PaymentServiceItem(
            title: 'Payer par NFC',
            icon: Icons.nfc_outlined,
            onPressed: () {},
            iconContainerColor: mauvePrimaryColor,
          ),
        ],
      ),
    );
  }
}
