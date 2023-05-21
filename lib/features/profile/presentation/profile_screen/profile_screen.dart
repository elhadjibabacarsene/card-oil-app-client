import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/profile_screen_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: const Text('Profile'),
      ),
      body: const ProfileScreenBody(),
    );
  }
}
