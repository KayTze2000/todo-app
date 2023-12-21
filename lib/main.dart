import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/login_page.dart';
import '../screens/theme_provider.dart';
import '../constants/colors.dart';

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
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeNotifier,child) {          
          return MaterialApp(
            theme: context.watch<ThemeProvider>().isDarkTheme ? ThemeData(
              brightness: Brightness.dark,   
              primaryColor: tdGrey, 
              canvasColor: const Color.fromARGB(255, 196, 196, 196),
            ) : ThemeData(
              brightness: Brightness.light,
              primaryColor: Colors.lightBlue,
              canvasColor: const Color.fromARGB(255, 50, 50, 50)
              //primarySwatch: Colors.green
            ),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Todo App',
            home: const LoginPage(),
          );
      }),
    );
  }
}
