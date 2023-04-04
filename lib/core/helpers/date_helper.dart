import 'package:intl/intl.dart';

class DateHelper {

  String formatDateToDDMMYYYY(String inputDate) {
    // Définir le format de la date d'entrée
    DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
    // Parser la date d'entrée
    DateTime dateTime = inputFormat.parse(inputDate);

    // Définir le format de la date de sortie
    DateFormat outputFormat = DateFormat("dd/MM/yyyy");
    // Formater la date de sortie
    String outputDate = outputFormat.format(dateTime);

    return outputDate;
  }

  String formatDateToDDMMYYYYHS(DateTime date) {
    var formatter = DateFormat('d MMM y à HH:mm', 'fr');
    return formatter.format(date);
  }

  String formatDateForHumanReadable(String date) {
    var inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ");
    var inputDate = inputFormat.parse(date); // <-- dd/MM 24H format

    var outputFormat = DateFormat('dd/MM/yyyy à HH:mm');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}