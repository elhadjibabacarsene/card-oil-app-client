import 'package:card_oil/core/bloc/user_details_bloc/user_details_bloc.dart';
import 'package:card_oil/core/error/failure.dart';
import 'package:card_oil/features/home_page/data/datasources/balance_datasource_impl.dart';
import 'package:card_oil/features/home_page/data/repositories/balance_repository_impl.dart';
import 'package:card_oil/features/home_page/presentation/bloc/get_balance_bloc/get_balance_bloc.dart';
import 'package:card_oil/features/sign_in/data/datasources/sign_in_data_source_impl.dart';
import 'package:card_oil/features/sign_in/data/repositories/sign_in_repository_impl.dart';
import 'package:card_oil/features/transaction_history/data/datasources/transaction_history_data_source_impl.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'core/helpers/amount_helper.dart';
import 'core/helpers/date_helper.dart';
import 'core/widgets/loading_message/loading_message.dart';
import 'features/transaction_history/data/repositories/transaction_history_repository_impl.dart';
import 'features/transaction_history/presentation/bloc/transaction_history_bloc/transaction_history_bloc.dart';

final sl = GetIt.instance;

void init() {
  // sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);

  sl.registerSingleton<LoadingMessage>(LoadingMessage());

  sl.registerSingleton<DateHelper>(DateHelper());
  sl.registerSingleton<AmountHelper>(AmountHelper());

  sl.registerSingleton<ServerFailure>(ServerFailure());

  sl.registerSingleton<SignInDataSourceImpl>(SignInDataSourceImpl());
  sl.registerSingleton<SignInRepositoryImpl>(
      SignInRepositoryImpl(signInDataSourceImpl: sl()));

  sl.registerSingleton<TransactionHistoryDataSourceImpl>(
      TransactionHistoryDataSourceImpl());
  sl.registerSingleton<TransactionHistoryRepositoryImpl>(
      TransactionHistoryRepositoryImpl(transactionHistoryDataSourceImpl: sl()));

  sl.registerSingleton<BalanceDataSourceImpl>(BalanceDataSourceImpl());
  sl.registerSingleton<BalanceRepositoryImpl>(BalanceRepositoryImpl(balanceDataSourceImpl: sl()));

  // sl.registerSingleton<GetBalanceBloc>(GetBalanceBloc());
  // sl.registerSingleton<TransactionHistoryBloc>(TransactionHistoryBloc());
  // sl.registerSingleton<UserDetailsBloc>(UserDetailsBloc());

  // sl.registerSingleton<LoadingMessage>(LoadingMessage());
}
