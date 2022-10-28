import 'package:flutter/material.dart';

import '../../../constants/colors/app_colors.dart';
import 'components/qr_code_body_screen.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyQuaternaryColor,
      appBar: AppBar(
        title: const Text('Scannez-moi'),
      ),
      body: const QrCodeBodyScreen(),
    );
  }
}
