import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingMessage {
   static void waiting() {
    EasyLoading.show(
      status: 'Patientez svp..',
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: false,
    );
  }

   static void error(String message, {duration=2}) {
    EasyLoading.showError(
      message,
      duration: Duration(seconds: duration),
    );
  }

   static void info(String message, {duration=2}) {
    EasyLoading.showInfo(
      message,
      duration:  Duration(seconds: duration),
      dismissOnTap: false,
      maskType: EasyLoadingMaskType.black,
    );
  }

   static void dismiss() {
    EasyLoading.dismiss();
  }
}
