import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>{

  String _nome = "";

  @override
  void initState(){
    super.initState();
    _retornarNome();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Center(
        child: Container(
          child: Text('Welcome, ${_nome}', style: TextStyle(fontSize: 25),),
        ),
      ),

    );
  }

  void _retornarNome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nome = prefs.getString("nome") ?? "Null";
    });
  }

}