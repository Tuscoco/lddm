import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Loginpage(),
    );
  }
}

class Loginpage extends StatelessWidget{

  const Loginpage({super.key});

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Login'),
      ),
      drawer: Drawer(),
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              TextField(
                decoration: InputDecoration(labelText: 'E-mail', border: OutlineInputBorder()),
                style: TextStyle(color: Colors.amber, fontSize: 30),
              ),
              const SizedBox(height: 20,),

              TextField(
                decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                style: TextStyle(color: Colors.amber, fontSize: 30),
              ),
              const SizedBox(height: 20,),

              Container(
                width: 100,
                child: ElevatedButton(
                  onPressed: () => {},
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
                    Text('Create an account', style: TextStyle(color: Colors.blue))

                  ],

                )
              )

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem> [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Eu'
          )

        ]
        ),
    );

  }

}