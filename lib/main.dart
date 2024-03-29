import 'package:card_oil/core/features/get_details_user/presentation/bloc/get_details_user_bloc.dart';
import 'package:card_oil/router/router.dart';
import 'package:card_oil/single_app.dart' as single_variable;
import 'package:card_oil_backend_client/card_oil_backend_client.dart';
import 'package:flutter/material.dart';

// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// import 'firebase_options.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

import 'theme/theme.dart';

var client = Client('http://localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  single_variable.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetDetailsUserBloc()..add(ToGetDetailsUser()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Card Oil',
        theme: themeApp(),
        onGenerateRoute: _appRouter.onGenerateRoute,
        builder: EasyLoading.init(),
      ),
    );
  }
}
