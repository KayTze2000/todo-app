import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/login_page.dart';
import '../screens/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeProvider>().isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Todo App',
      home: const LoginPage(),
    );
  }
}
