class TransactionHistoryModel {
  final String title;
  final String date;
  final String amount;
  final String status;
  final String quantity;
  final String code;

  TransactionHistoryModel({
    required this.title,
    required this.status,
    required this.amount,
    required this.date,
    required this.quantity,
    required this.code,
  });
}
