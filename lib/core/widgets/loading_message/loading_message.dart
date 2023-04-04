import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingMessage {
  void waiting() {
    EasyLoading.show(
      status: 'Patientez svp..',
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false,
    );
  }

  void error(String message, {duration = 2}) {
    EasyLoading.showError(
      message,
      duration: Duration(seconds: duration),
    );
  }

  void info(String message) {
    EasyLoading.showInfo(
      message,
      duration: const Duration(seconds: 2),
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
  }

  void dismiss() {
    EasyLoading.dismiss();
  }
}
