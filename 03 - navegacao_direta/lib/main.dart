import 'package:flutter/material.dart';
import 'package:navegacao_direta/about_page.dart';
import 'package:navegacao_direta/login_page.dart';
import 'package:navegacao_direta/register_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage>{

  int _currentIndex = 0;

  final List<String> _titles = [
    "Home",
    "Account",
    "About",
    "Register"
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: bottomNavigationBar(),
      body: IndexedStack(index: _currentIndex, children: [MyHomePage(), Loginpage(), AboutPage(), RegisterPage()],),
    );
  }

  AppBar appBar(){
    return AppBar(
        backgroundColor: Colors.blue,
        title: Text(_titles[_currentIndex]),
    );
  }

  BottomNavigationBar bottomNavigationBar(){
    return BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
      );
  }

}
