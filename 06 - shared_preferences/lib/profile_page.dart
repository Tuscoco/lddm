import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget{

  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();

}

class _ProfilePageState extends State<ProfilePage>{

  String _nome = "";
  String _email = "";

  @override
  void initState(){
    super.initState();
    _recuperarCredenciais();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Name: ${_nome} \n Email: ${_email}', style: TextStyle(fontSize: 25),),
        ),
      ),
    );
  }

  void _recuperarCredenciais() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nome = prefs.getString("nome") ?? "Null";
      _email = prefs.getString("email") ?? "Null";
    });
  }

}