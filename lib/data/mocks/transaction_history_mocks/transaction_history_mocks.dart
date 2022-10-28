import '../../models/transaction_history_item_model/transaction_history_model.dart';

List<TransactionHistoryModel> transactionHistoryMocks = [
  TransactionHistoryModel(
    title: 'Achat chez Total Parcelles',
    status: 'TS',
    quantity: '18L',
    amount: '5 000',
    date: '30/10/2022',
    code: 'CO01234555',
  ),
  TransactionHistoryModel(
    title: 'Achat chez Shell Castor',
    status: 'TS',
    quantity: '50L',
    amount: '10 000',
    date: '05/11/2022',
    code: 'CO01234555',
  ),
  TransactionHistoryModel(
    title: 'Rechargement chez Shell Almadies',
    status: 'TF',
    quantity: '20L',
    amount: '20 000',
    date: '15/11/2022',
    code: 'CO01234555',
  ),
  TransactionHistoryModel(
    title: 'Rechargement chez Total Parcelles',
    status: 'TC',
    quantity: '25L',
    amount: '5 000',
    date: '30/10/2022',
    code: 'CO01234555',
  ),
];
