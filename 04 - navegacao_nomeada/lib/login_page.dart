import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{

  const LoginPage({super.key});

  @override
  _LoginpageState createState() => _LoginpageState();

}

class _LoginpageState extends State<LoginPage>{

  TextEditingController _nameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  String _email = "teste@gmail.com";
  String _senha = "123";

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text('Login'),),
      body: body(context),
    );
  }

  Center body(BuildContext context){
    return Center(
      child: Container(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            TextField(
              decoration: InputDecoration(labelText: 'Nome', border: OutlineInputBorder()),
              style: TextStyle(fontSize: 30),
              controller: _nameController,
            ),
            const SizedBox(height: 20,),

            TextField(
              decoration: InputDecoration(labelText: 'E-mail', border: OutlineInputBorder()),
              style: TextStyle(fontSize: 30),
              controller: _emailController,
            ),
            const SizedBox(height: 20,),

            TextField(
              decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
              style: TextStyle(fontSize: 30),
              controller: _senhaController,
            ),
            const SizedBox(height: 20,),

            Container(
              width: 100,
              child: ElevatedButton(
                onPressed: () => {
                  setState(() {
                    bool verificar = verificarCredenciais();
                    if(verificar){
                      Navigator.of(context).pushNamed(
                        "/list", arguments: _nameController.text
                      );
                    }else{
                      showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text('CREDENCIAIS INCORRETAS'),
                          );
                        }
                      );
                    }
                  })
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(60, 50),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                child: Text('Enter', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20,),

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('New here ?', style: TextStyle(color: Colors.black),),
                  SizedBox(width: 5,),
                  //Text('Create an account', style: TextStyle(color: Colors.blue))
                  TextButton(
                    onPressed: (){
                    },
                    child: Text('Create an account')
                  )

                ],

              )
            )

          ],
        ),
      ),
    );
  }

  bool verificarCredenciais(){
    if(_emailController.text == _email && _senhaController.text == _senha){
      return true;
    }
    return false;
  }

}