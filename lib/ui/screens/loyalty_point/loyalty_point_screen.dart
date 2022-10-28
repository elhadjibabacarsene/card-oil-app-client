import 'package:card_oil/ui/screens/loyalty_point/components/loyalty_point_body_screen.dart';
import 'package:flutter/material.dart';

class LoyaltyPointScreen extends StatelessWidget {
  const LoyaltyPointScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes Points de fidélité'),
      ),
      body: const LoyaltyPointBodyScreen(),
    );
  }
}
