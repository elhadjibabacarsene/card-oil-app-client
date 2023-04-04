class AmountHelper {
  String formatAmount(int amount) {
    // Convertir la somme d'argent en une chaîne de caractères sans décimale
    String strAmount = amount.toInt().toString();

    // Ajouter des espaces pour séparer les milliers
    var formattedAmount = strAmount.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]} ');

    // Ajouter la décimale si la somme d'argent a une partie décimale
    if (amount.remainder(1) != 0) {
      String decimals = (amount.remainder(1) * 100).toInt().toString();
      formattedAmount += ',$decimals';
    }

    return formattedAmount;
  }
}