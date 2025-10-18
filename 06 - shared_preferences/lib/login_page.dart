import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget{

  const LoginPage({super.key});

  @override
  _LoginpageState createState() => _LoginpageState();

}

class _LoginpageState extends State<LoginPage>{

  var _email = "";
  var _senha = "";
  bool _visibilidade = true;

  @override
  Widget build(BuildContext context){
    return Scaffold(
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

            Text('Login', style: TextStyle(fontSize: 30),),
            const SizedBox(height: 20,),

            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'E-mail', border: OutlineInputBorder()),
              style: TextStyle(fontSize: 30),
              onChanged: (String email){
                _email = email;
              },
            ),
            const SizedBox(height: 20,),

            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                suffixIcon: Container(
                  child: IconButton(
                    onPressed: (){
                      setState(() {
                        _visibilidade = !_visibilidade;
                      });
                    },
                    icon: Icon(_visibilidade ? Icons.visibility_off : Icons.visibility)
                  ),
                )
              ),
              obscureText: _visibilidade,
              style: TextStyle(fontSize: 30),
              onChanged: (String senha){
                _senha = senha;
              },
            ),
            const SizedBox(height: 20,),

            Container(
              width: 100,
              child: ElevatedButton(
                onPressed: () async {

                  bool verificacao = await _verificarCredenciais();

                  if(verificacao){
                    print("Login feito com sucesso!");
                    Navigator.of(context).pushNamed("/home");
                  }else{
                    print("Login falhou!");
                    showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text('CREDENCIAIS INVÁLIDAS'),
                          content: Text('O email ou a senha está incorreto!'),
                        );
                      }
                    );
                  }

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
                      Navigator.of(context).pushNamed('/register');
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

  ////////////////////////////////////////////////////////////////////////////////////

  Future<bool> _verificarCredenciais() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

    var _emailSalvo = prefs.getString("email") ?? "Null";
    var _senhaSalva = prefs.getString("senha") ?? "Null";

    if(_emailSalvo == _email && _senhaSalva == _senha){
      return true;
    }

    return false;

  }

}