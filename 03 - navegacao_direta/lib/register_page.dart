import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{

  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
  
}

enum Genero {masculino, feminino}

class _RegisterPageState extends State<RegisterPage>{
  
  var _email = "";
  var _senha = "";
  var _nome = "";
  var _dataNas = "";
  bool _visibilidade = true;
  bool _emailMarcado = false;
  bool _celularMarcado = false;

  Genero? _generoSelecionado;

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: appBar(),
      body: body(),
      bottomNavigationBar: bottomNavigationBar(),
    );

  }

  AppBar appBar(){
    return AppBar(
      title: Text('Create an account'),
      backgroundColor: Colors.blue,
    );
  }

  BottomNavigationBar bottomNavigationBar(){
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'About'
        ),
      ]
    );
  }

  Center body(){
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(

          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(40),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nome'
                  ),
                  style: TextStyle(
                    fontSize: 30
                  ),
                  onSubmitted: (String nome){
                    _nome = nome;
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.all(40),
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: 'Data de Nascimento'
                  ),
                  style: TextStyle(
                    fontSize: 30
                  ),
                  onSubmitted: (String dataNas){
                    _dataNas = dataNas;
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.all(40),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'E-mail'
                  ),
                  style: TextStyle(
                    fontSize: 30
                  ),
                  onSubmitted: (String email){
                    _email = email;
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.all(40),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    suffixIcon: Container(
                      child: IconButton(
                        onPressed: (){
                          setState(() {
                            _visibilidade = !_visibilidade;
                          });
                        },
                        icon: Icon(_visibilidade ? Icons.visibility_off : Icons.visibility)
                      ),
                    ),
                  ),
                  obscureText: _visibilidade,
                  style: TextStyle(
                    fontSize: 30
                  ),
                  onSubmitted: (String senha){
                    _senha = senha;
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.all(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Text('Gênero:     '),
                    
                    Row(
                      children: [
                        const Text("Masculino"),
                        Radio(
                          value: Genero.masculino,
                          groupValue: _generoSelecionado,
                          onChanged: (Genero? value){
                            setState(() {
                              _generoSelecionado = value;
                            });
                          }
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Text("Feminino"),
                        Radio(
                          value: Genero.feminino,
                          groupValue: _generoSelecionado,
                          onChanged: (Genero? value){
                            setState(() {
                              _generoSelecionado = value;
                            });
                          }
                        ),
                      ],
                    ),
                  ],
                )
              ),

              Center(child: const Text('Notificações'),),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('E-mail'),
                    Switch(
                      value: _emailMarcado,
                      onChanged: (bool value) {
                        setState(() {
                          _emailMarcado = !_emailMarcado;
                        });
                      }
                    )
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Celular'),
                    Switch(
                      value: _celularMarcado,
                      onChanged: (bool value) {
                        setState(() {
                          _celularMarcado = !_celularMarcado;
                        });
                      }
                    )
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text('Register', style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              )
            ],
          ),

        )
      )

    );

  }

}