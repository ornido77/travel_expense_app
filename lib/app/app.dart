import 'package:flutter/material.dart';

import 'router/app_router.dart';

class TravelExpenseApp extends StatelessWidget {
  const TravelExpenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Travel Expenses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        cardTheme: const CardThemeData(
          margin: EdgeInsets.zero,
        ),
      ),
      routerConfig: appRouter,
    );
  }
}
