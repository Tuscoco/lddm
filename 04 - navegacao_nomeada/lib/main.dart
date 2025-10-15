import 'package:flutter/material.dart';
import 'login_page.dart';
import 'list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),),
      home: LoginPage(),
      initialRoute: "/",
      routes: {
        "/list": (context) {
          final valor = ModalRoute.of(context)!.settings.arguments as String;
          return ListPage(valor);
        },
      },
    );
  }
}