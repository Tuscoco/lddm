import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget{

  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
  
}

class _RegisterPageState extends State<RegisterPage>{
  
  var _email = "";
  var _senha = "";
  var _nome = "";
  bool _visibilidade = true;

  @override
  Widget build(BuildContext context){

    return Scaffold(
      body: body(),
    );

  }

  Center body(){
    return Center(
      child: Container(
        width: 300,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Text('Registrar', style: TextStyle(fontSize: 30),),
            const SizedBox(height: 20,),

            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: 'Nome', border: OutlineInputBorder()),
              style: TextStyle(fontSize: 30),
              onChanged: (String nome){
                _nome = nome;
              },
            ),
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
                onPressed: () {
                  _salvarCredenciais();
                  Navigator.of(context).pushNamed('/');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(60, 50),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  )
                ),
                child: Text('Registrar', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }

  ///////////////////////////////////////////////////////////////////////////////////

  void _salvarCredenciais() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString("email", _email);
    prefs.setString("nome", _nome);
    prefs.setString("senha", _senha);

    print("Salvando: \n Email: ${_email} \n Nome: ${_nome} \n Senha: ${_senha} \n");

  }

}