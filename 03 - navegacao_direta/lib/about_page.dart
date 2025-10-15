import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget{

  const AboutPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Essa é uma página de sobre, mas não tem nada para falar!'),
        ),
      ),
    );
  }

}