import 'package:card_oil/ui/screens/nfc_screen/components/nfc_body_screen.dart';
import 'package:flutter/material.dart';

class NfcScreen extends StatelessWidget {
  const NfcScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payer par NFC'),
      ),
      body: const NfcBodyScreen(),
    );
  }
}
