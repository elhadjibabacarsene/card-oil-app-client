class QrCodeHelper {
   final now = DateTime.now().toUtc();


  getExpirationDate() {
    final expiryDate = now.add(const Duration(seconds: 1));
    return expiryDate.toIso8601String();
  }

  getTimeStamp() {
    now.toIso8601String();
  }
}
