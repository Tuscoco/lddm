import 'package:flutter/material.dart';
import 'package:shared_preferences_app/list_page.dart';
import 'profile_page.dart';
import 'login_page.dart';
import 'register_page.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => MainPage()
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<String> _titles = [
    "Home",
    "List",
    "Profile",
  ];

  final List<Widget> _pages = [
    MyHomePage(),
    ListPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      bottomNavigationBar: bottomNavigationBar(),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text(_titles[_currentIndex]),
      actions: [
        IconButton(
          icon: const Icon(Icons.person_add),
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
        ),
      ],
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
